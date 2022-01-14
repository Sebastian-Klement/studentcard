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
        // child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Container(
                height: 200,
                child: SfBarcodeGenerator(
                  value:
                      'Der Studierendenausweis ist validiert. Er gültig von 01.10.2021 bis 14.03.2022',
                  symbology: QRCode(),
                  showValue: false,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page');
              },
              child: Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
