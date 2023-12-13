import 'package:flutter/material.dart';

class ScannedResult extends StatelessWidget {
  const ScannedResult({super.key,required this.code });
 final String code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: double.maxFinite,
                height: 50,
              child: Text(code),
            ))
          ],
        ),
      ),
    );
  }
}