import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcodescanner/scanned_output.dart';

class Scanner extends StatefulWidget {
   Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {

 String code = "";
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  bool isProcessing = false;
  
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    
    controller?.dispose();
    super.dispose();
  
  }

  void navigateToResult(String code ){
    if (!isProcessing) {
      setState(() {
        isProcessing =true;
      });
      Timer(Duration(seconds: 1), () {
        Navigator.push(context,MaterialPageRoute(builder: (context) =>ScannedResult(code: code))).then((_) {
          setState(() {
            isProcessing = false;
          });
        });

       });
    }

        
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Column(
          children: [
            // MobileScannerController()
            Expanded(child: Container(child: Text("Scan the QR Code", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),)),
            Expanded(
              flex: 2,
              child: Container(
                // height: 20,
                child: QRView(
                  key: qrKey, 
                  onQRViewCreated: _onQRViewCreated,
                  // cameraFacing: ,
                  overlay: QrScannerOverlayShape(
                    borderWidth: 5
                    
                    // cutOutHeight: 40
                    // cutOutSize: 2
                  ),
                  ),
                  )),
            // Expanded(child: Container(color: Color(0xffffffff),
            // child: Text(
            //   // code != null? 
              
            //   "Scannned code = ${code}"
            //   // :""

            //   ),
            // )),
          ],
        ),
      ),
    );

    
  }
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        code = scanData.code!;
        navigateToResult(code);
        
      });
    });
  }
}