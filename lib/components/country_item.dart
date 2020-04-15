import 'package:covid19_app/model/country.dart';
import 'package:covid19_app/util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryItem extends StatefulWidget {
  final Country country;

  CountryItem(this.country);

  @override
  _CountryItemState createState() => _CountryItemState();
}

class _CountryItemState extends State<CountryItem> {
  final formatter = new NumberFormat("#,###");
  Responsive responsive;
  double containerHeight;
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    containerHeight =
        containerHeight == null ? responsive.ip(6) : containerHeight;
    return InkWell(
      onTap: () {
        expanded = expanded ? false : true;
        if (expanded) {
          containerHeight = responsive.ip(12);
        } else {
          containerHeight = responsive.ip(6);
        }
        setState(() {});
      },
      child: Container(
          height: containerHeight,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color:  expanded
                ?Color(0xFFf0f0f0):Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5.0,
                spreadRadius: 1.0,
                offset: Offset(
                  2.0,
                  2.0,
                ),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                    width: responsive.ip(5),
                    height: responsive.ip(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: AssetImage('icons/flags/png/2.5x/${widget.country.countryCode.toLowerCase()}.png', package: 'country_icons'))),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        widget.country.country,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(1.8),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '${!expanded ? formatter.format(widget.country.totalConfirmed) : ''}',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: responsive.ip(1.5),
                          ),
                        ),
                      ),
                      Text(
                        '${!expanded ? 'Confirmados' : ''}',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                          fontSize: responsive.ip(1.2),
                        ),
                      )
                    ],
                  )
                ],
              ),
              expanded
                  ? Column(
                      children: <Widget>[
                        SizedBox(height: responsive.ip(1),),
                        Divider(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            itemCount(widget.country.totalConfirmed,
                                "Confirmados", Colors.red),
                            itemCount(widget.country.totalRecovered,
                                "Recuperados", Colors.green),
                            itemCount(widget.country.totalDeaths, "Fallecidos",
                                Colors.grey),
                          ],
                        )
                      ],
                    )
                  : Container()
            ],
          )),
    );
  }

  Widget itemCount(int count, String title, Color color) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            count.toString(),
            style: TextStyle(color: color, fontSize: responsive.ip(1.6)),
          ),
          Text(
            title,
            style: TextStyle(
                color: color,
                fontSize: responsive.ip(1.5),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
