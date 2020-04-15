import 'package:covid19_app/components/header.dart';
import 'package:covid19_app/components/world_item.dart';
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
        body: Stack(
          children: <Widget>[
            Header(
              icon:  FontAwesomeIcons.globeAmericas,
              color: Colors.white.withOpacity(0.1),
              title:  Center(
                    child: Text("Estadísticas Globales",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: responsive.ip(3)

                      ),),
                  )

            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      WorldItem(
                          "Confirmados",
                          FontAwesomeIcons.virus,
                          Color(0xFFFCE1EC),
                          covidProvider.summary.global.totalConfirmed),
                      WorldItem(
                          "Fallecidos",
                          FontAwesomeIcons.skull,
                          Color(0xFFe5e3e4),
                          covidProvider.summary.global.totalDeaths),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      WorldItem(
                          "Recuperados",
                          FontAwesomeIcons.heart,
                          Color(0xFFe0f9e6),
                          covidProvider.summary.global.totalRecovered),
                    ],
                  ),

                Center(
                    child:  Text("#QuedateEncasa"),
                  )
                ],
              ),
            ),
          ],
        ));
  }


}
