import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ohm_card/models/models.dart';
import 'package:ohm_card/service/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class BibliothekPage extends StatefulWidget {
  @override
  BibliothekPageState createState() => BibliothekPageState();
}

class BibliothekPageState extends State<BibliothekPage> {
  var _libraryId, _studentId;
  var medium = new Medium(0, "0", "0", "0");

  _getLibraryId() async {
    Map<String, dynamic> userMap;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userStr = prefs.getString('user') ?? "";
    userMap = jsonDecode(userStr) as Map<String, dynamic>;

    setState(() {
      _libraryId = LoginResponseModel.fromJson(userMap).libraryId;
      _studentId = LoginResponseModel.fromJson(userMap).studentId;
    });
  }

  _getMedium() async {
    var api = new Api();
    api.getMedium(_studentId);

    Map<String, dynamic> mediumMap;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String mediumStr = prefs.getString('medium') ?? "";
    mediumMap = jsonDecode(mediumStr) as Map<String, dynamic>;

    setState(() {
      medium = Medium.fromJson(mediumMap);
    });
  }

  @override
  void initState() {
    super.initState();
    _getLibraryId();
    _getMedium();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Container(
                height: 200,
                child: SfBarcodeGenerator(
                  value: _libraryId,
                  symbology: Code128(),
                  showValue: true,
                ),
              ),
            ),
            Text("Derzeit keine Medie geliehen" + medium.title),
          ],
        ),
      ),
    );
  }
}
