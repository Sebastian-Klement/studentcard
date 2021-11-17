import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class VerifyPage extends StatefulWidget {
  @override
  VerifyPageState createState() => VerifyPageState();
}

class VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          child: SfBarcodeGenerator(
            value: 'Hallo Welt',
            symbology: QRCode(),
            showValue: true,
          ),
        ),
        // body: SingleChildScrollView(
        //   child: Center(
        //     child: Container(
        //       width: double.infinity,
        //       height: 300,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           Text('Scan to verify this OHMcard'),
        //           Expanded(
        //             child: QrImage(data: 'Hallo Welt'),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
