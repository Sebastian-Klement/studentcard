import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class BibliothekPage extends StatefulWidget {
  @override
  BibliothekPageState createState() => BibliothekPageState();
}

class BibliothekPageState extends State<BibliothekPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          child: SfBarcodeGenerator(
            value: '05601205784',
            symbology: Code128(),
            showValue: true,
          ),
        ),
      ),
    );
  }
}
