import 'package:flutter/material.dart';
import 'package:ohm_card/models/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //late User user;

    return Scaffold(
      body: Center(
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
                  Text("value.firstname + value.surname "),
                  Text("value.birthday"),
                  Text("value.studentId"),
                  Text("value.libraryId."),
                  Text("Gültig von value.date bis value.date"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
