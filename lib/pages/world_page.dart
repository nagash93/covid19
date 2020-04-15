import 'package:covid19_app/components/header.dart';
import 'package:covid19_app/components/world_item.dart';
import 'package:covid19_app/model/country.dart';
import 'package:covid19_app/providers/covid_provider.dart';
import 'package:covid19_app/util/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WorldPage extends StatelessWidget {
  CovidProvider covidProvider;
  Responsive responsive;
  ThemeData theme;
  @override
  Widget build(BuildContext context) {
    covidProvider = Provider.of<CovidProvider>(context);
    responsive = Responsive(context);
    theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Header(
                icon: FontAwesomeIcons.globeAmericas,
                color: Colors.white.withOpacity(0.1),
                title: Center(
                  child: Text(
                    "Estadísticas Globales",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: responsive.ip(3)),
                  ),
                )),
            SizedBox(
              height: responsive.ip(3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WorldItem(
                    "Confirmados",
                    FontAwesomeIcons.virus,
                    theme.accentColor,
                    covidProvider.summary.global.totalConfirmed),
              ],
            ),
            SizedBox(
              height: responsive.ip(2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                WorldItem(
                    "Recuperados",
                    FontAwesomeIcons.heart,
                    Color(0xFF55e89a),
                    covidProvider.summary.global.totalRecovered),
                WorldItem(
                    "Fallecidos",
                    FontAwesomeIcons.skull,
                    Color(0xFFd2ddd7),
                    covidProvider.summary.global.totalDeaths),
              ],
            ),
          ]),
    );
  }
}
