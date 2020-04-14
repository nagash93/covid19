import 'package:covid19_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19',
        theme: ThemeData(
            primaryColor: Color(0xFF3dbbcc),
            primaryColorLight: Color(0xFFD8ECF1),
          //  textTheme: GoogleFonts.muliTextTheme()
        ),
      home: HomePage()
    );
  }
}
