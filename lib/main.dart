import 'package:covid19_app/pages/home_page.dart';
import 'package:covid19_app/providers/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: CovidProvider()),
        ],
        child: MaterialApp(
            title: 'Covid-19',
            theme: ThemeData(
              primaryColor: Color(0xFF3dbbcc),
              primaryColorLight: Color(0xFFD8ECF1),
              //  textTheme: GoogleFonts.muliTextTheme()
            ),
            home: HomePage()));
  }
}
