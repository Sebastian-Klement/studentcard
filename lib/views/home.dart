// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ohm_card/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginResponseModel? user;

  _getUserInfo() async {
    Map<String, dynamic> userMap;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userStr = prefs.getString('user') ?? "";
    userMap = jsonDecode(userStr) as Map<String, dynamic>;
    setState(() {
      user = LoginResponseModel.fromJson(userMap);
      final String token = user!.token;
      prefs.setString('token', "$token");
    });
  }

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
        // child: Center(
        child: Column(
          children: <Widget>[
            //Image des Studi von db über ohm server fetchen
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Image.asset(
                "assets/images/ohm_logo.png",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 75.0,
                top: 10.0,
                right: 75.0,
                bottom: 10.0,
              ),
              child: Image.asset(
                "assets/images/student.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30.0,
                top: 10.0,
                right: 30.0,
                bottom: 30.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Name: " + user!.firstname + " " + user!.surname),
                  Text("Birthday: " + user!.birthday),
                  Text("Student-ID: " + user!.studentId.toString()),
                  Text("Valid: 2021.10.01 until 2022.03.14"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Container(
                height: 80,
                width: 150,
                constraints: BoxConstraints(
                  minWidth: 200,
                  maxWidth: 400,
                ),
                decoration: BoxDecoration(
                    //color: Colors.blue,
                    borderRadius: BorderRadius.circular(2)),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/verify');
                  },
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Verify studentcard '),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            //folgendes padding in verifypage ausgelagert :)
            // Padding(
            //   padding: EdgeInsets.all(30.0),
            //   child: Container(
            //     height: 200,
            //     child: SfBarcodeGenerator(
            //       value:
            //           'Der Studierendenausweis ist validiert. Er gültig von 01.10.2021 bis 14.03.2022',
            //       symbology: QRCode(),
            //       showValue: false,
            //     ),
            //   ),
            // ),
          ],
        ),
        // ),
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

  // kann dann wech :)
  // _getValidation() {}
}
