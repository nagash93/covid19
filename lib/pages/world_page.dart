import 'package:covid19_app/components/world_item.dart';
import 'package:covid19_app/providers/covid_provider.dart';
import 'package:covid19_app/util/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class WorldPage extends StatelessWidget {

  CovidProvider covidProvider;
  @override
  Widget build(BuildContext context) {
    covidProvider = Provider.of<CovidProvider>(context);
    final responsive = Responsive(context);
    return Scaffold(
      backgroundColor: Color(0xFFF2F4F5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WorldItem(
                  "Confirmados",
                  FontAwesomeIcons.virus,
                  Color(0xFFECE5FD),
                  covidProvider.summary.global.totalConfirmed),
              WorldItem("Muertos", FontAwesomeIcons.skull, Color(0xFFFCE1EC),
                  covidProvider.summary.global.totalDeaths),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WorldItem("Nuevos Recuperados", FontAwesomeIcons.heart,
                  Color(0xFFf9f9e0), covidProvider.summary.global.newRecovered),
              WorldItem(
                  "Recuperados",
                  FontAwesomeIcons.heart,
                  Color(0xFFe0f9e6),
                  covidProvider.summary.global.totalRecovered),
            ],
          )
        ],
      ),
    );
  }


}
