import 'package:covid19_app/components/arrow_animation.dart';
import 'package:covid19_app/components/country_item.dart';
import 'package:covid19_app/components/header.dart';
import 'package:covid19_app/model/summary.dart';
import 'package:covid19_app/providers/covid_provider.dart';
import 'package:covid19_app/util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CountryListPage extends StatelessWidget {
  CovidProvider covidProvider;

  @override
  Widget build(BuildContext context) {
    covidProvider = Provider.of<CovidProvider>(context);
    final responsive = Responsive(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(alignment: Alignment(0, -1.1), children: <Widget>[
        Header(
          icon: FontAwesomeIcons.virus,
          title: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Covid-19",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: responsive.ip(2.5),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Tracker",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: responsive.ip(2),
                        fontWeight: FontWeight.bold),
                  ),
                ]),
            margin: EdgeInsets.all(20),
          ),
          subMenu:Container(

            margin: EdgeInsets.all(5),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  child: Text(
                    "Orden",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: covidProvider.changeOrderName,
                ),
                covidProvider.order == null
                    ? IconButton(
                    icon: Icon(
                      Icons.sort,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: covidProvider.changeOrder)
                    : ArrowAnimation(
                    covidProvider.order, covidProvider.changeOrder)
              ],
            ),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: responsive.hp(20),
            ),
            Container(
                width: responsive.wp(100),
                height: responsive.hp(75),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                          itemCount: covidProvider.summary.countries.length,
                          itemBuilder: (context, index) {
                            return CountryItem(
                                covidProvider.summary.countries[index]);
                          }),
                    )
                  ],
                ))
          ],
        ),
      ]),
    );
  }
}
