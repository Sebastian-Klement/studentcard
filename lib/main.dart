import 'package:flutter/material.dart';
import 'package:ohm_card/landing.dart';
import 'package:ohm_card/Views/bibliothek.dart';
import 'package:ohm_card/Views/login.dart';
import 'package:ohm_card/Views/home.dart';
import 'package:ohm_card/Views/mensa.dart';
import 'package:ohm_card/Views/navigation.dart';
import 'package:ohm_card/Views/verify.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OHMcard',
      initialRoute: '/',
      routes: {
        '/': (context) => Landing(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/bibliothek': (context) => BibliothekPage(),
        '/mensa': (context) => MensaPage(),
        '/page': (context) => NavigationBarPage(),
        '/verify': (context) => VerifyPage(),
      },
    );
  }
}
