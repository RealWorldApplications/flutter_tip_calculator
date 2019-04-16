import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(new TipCalculator());

class TipCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Tip Calculator',
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple[800],
        accentColor: Colors.purple[200],
        backgroundColor: Colors.white70,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          display1: TextStyle(fontSize: 20.0),
          display2: TextStyle(fontSize: 25.0),
          headline: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        )
      ),
      home: new HomePage(),
    );
  }
}

