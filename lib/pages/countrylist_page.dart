import 'package:covid19_app/components/arrow_animation.dart';
import 'package:covid19_app/components/country_item.dart';
import 'package:covid19_app/model/summary.dart';
import 'package:covid19_app/providers/covid_provider.dart';
import 'package:covid19_app/util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryListPage extends StatelessWidget {

  CovidProvider covidProvider;


  @override
  Widget build(BuildContext context) {
    covidProvider = Provider.of<CovidProvider>(context);
    ThemeData theme = Theme.of(context);
    final responsive = Responsive(context);
    return Container(
        width: responsive.wp(100),
        color: Color(0xFFF2F4F5),
        child: Column(
          children: <Widget>[
            Container(
              width: responsive.wp(100),
              decoration: BoxDecoration(
                  color: theme.primaryColorDark,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: SafeArea(
                  child: Text(
                "Covid-19 Tracker",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              )),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(child:Text("Orden"),
                  onTap: covidProvider.changeOrderName,
                ),
                covidProvider.order==null?
    IconButton(icon: Icon(Icons.sort)   , onPressed: covidProvider.changeOrder):
    ArrowAnimation(covidProvider.order,covidProvider.changeOrder)
              ],
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: covidProvider.summary.countries.length,
                  itemBuilder: (context, index) {
                    return CountryItem(covidProvider.summary.countries[index]);
                  }),
            )
          ],
        ));
  }
}
