import 'package:covid19_app/pages/home_page.dart';
import 'package:covid19_app/providers/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>CovidProvider()),
        ],
        child: MaterialApp(
            title: 'Covid-19',
            theme: ThemeData(
              accentColor: Color(0xFFEA5569),
              primaryColorLight: Color(0xFFD8ECF1),
              primaryColorDark: Color(0xff212B46),
              primaryColor: Color(0xff212B46),
              textTheme: GoogleFonts.ubuntuTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            home: HomePage()));
  }
}
