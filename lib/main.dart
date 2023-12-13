import 'package:flutter/material.dart';
import 'package:qrcodescanner/scanned_output.dart';
import 'package:qrcodescanner/scanner.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      // routes: {
      //   "output":(context) => ScannedResult(code: code);
      // },
      home: Scanner(),
    );
  }
}