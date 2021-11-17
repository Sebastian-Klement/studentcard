import 'package:flutter/material.dart';
import 'package:ohm_card/screens/bibliothek.dart';
import 'package:ohm_card/screens/login.dart';
import 'package:ohm_card/screens/home.dart';
import 'package:ohm_card/landing.dart';
import 'package:ohm_card/screens/mensa.dart';
import 'package:ohm_card/screens/navigation.dart';
import 'package:ohm_card/screens/verify.dart';

import 'landing.dart';

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
        '/verify': (context) => VerifyPage(),
        '/page': (context) => NavigationBarPage(),
      },
    );
  }
}
