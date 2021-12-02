import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ohm_card/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String token = "";
  // String username = "";
  // String email = "";
  // String birthday = "";
  // String firstname = "";
  // String surname = "";

  LoginResponseModel? user;

  @override
  void initState() {
    super.initState();
    //_getStringValue();
    _getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              // Image des Studi von db über ohm server fetchen
              Image.asset(
                "images/ohm_logo.png",
                fit: BoxFit.fill,
              ),
              Image.asset(
                "images/bear.png",
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Name: " + user!.firstname + " " + user!.surname),
                    Text("Birthday: " + user!.birthday),
                    Text("StudentId: " + user!.studentId.toString()),
                    Text("Gültig von value.date bis value.date"),
                    Text("Token: " + user!.token)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Container(
                  height: 200,
                  child: SfBarcodeGenerator(
                    value: 'Hallo Welt',
                    symbology: QRCode(),
                    showValue: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
//Backup falls nötig, kann sonst gelöscht werden
  //_getStringValue() async {
  //   final pref = await SharedPreferences.getInstance();
  //   //setState(() {
  //   token = (pref.getString("token") ?? "");
  //   username = (pref.getString("username") ?? "");
  //   firstname = (pref.getString("firstname") ?? "");
  //   surname = (pref.getString("surname") ?? "");
  //   birthday = (pref.getString("birthday") ?? "");
  //   //});
  //   print("GetStringValue token: " + token);
  // }

  // _getValidation() {}
  _getUserInfo() async {
    Map<String, dynamic> userMap;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userStr = prefs.getString('user') ?? "";
    userMap = jsonDecode(userStr) as Map<String, dynamic>;

    setState(() {
      user = LoginResponseModel.fromJson(userMap);
    });
  }
}
