import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ohm_card/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class VerifyPage extends StatefulWidget {
  @override
  VerifyPageState createState() => VerifyPageState();
}

class VerifyPageState extends State<VerifyPage> {
  String _validationTxt = "";
  bool _isValide = false;
  String _firstname = "";
  String _surname = "";
  _validatorText() async {
    Map<String, dynamic> userMap;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userStr = prefs.getString('user') ?? "";
    userMap = jsonDecode(userStr) as Map<String, dynamic>;

    setState(() {
      _firstname = LoginResponseModel.fromJson(userMap).firstname;
      _surname = LoginResponseModel.fromJson(userMap).surname;
    });

    if (_isValide) {
      _validationTxt =
          "This student card is owned by\n $_firstname $_surname\n is validated.";
      _isValide = false;
    } else {
      _validationTxt = "Invalid student card";
      _isValide = false;
    }
  }

  _getValidationState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String _token = prefs.getString('token') ?? "";
    print("token in verify: $_token");

    if (_token.isNotEmpty) {
      print("Token is not empty");
      _isValide = true;
    }

    setState(() {
      _validatorText();
    });
  }

  @override
  void initState() {
    super.initState();
    _getValidationState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Validation'),
      ),
      body: Center(
        // child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Container(
                child: Text(
                    "Please scan this qr-code\nto validate this student card."),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Container(
                height: 200,
                child: SfBarcodeGenerator(
                  value: "$_validationTxt",
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
