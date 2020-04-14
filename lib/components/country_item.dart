import 'package:covid19_app/model/country.dart';
import 'package:covid19_app/util/responsive.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryItem extends StatelessWidget {
  final formatter = new NumberFormat("#,###");
  final Country country;

  CountryItem(this.country);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: Offset(
              5.0,
              5.0,
            ),
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(

            child: Flags.getMiniFlag(
                country.countryCode, responsive.ip(4), responsive.ip(1.5)),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),

            child: Text(
              country.country,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: Colors.black,
                fontSize: responsive.ip(2),
              ),
            ),
          ),
          ),

          Container(
            child: Text('${formatter.format(country.totalConfirmed)}',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),),
          )
        ],
      ),
    );
    ;
  }
}
