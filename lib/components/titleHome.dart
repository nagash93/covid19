import 'package:covid19_app/util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TitleHome extends StatelessWidget {
  final String title, subTitle;

  TitleHome(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      width: responsive.wp(100),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: SafeArea(
          child: Row(

        children: <Widget>[
          SizedBox(width: responsive.ip(2),),
          Icon(
            FontAwesomeIcons.virus,
            color: Theme.of(context).accentColor,
            size: responsive.ip(3),
          ),
          SizedBox(width: responsive.ip(0.5),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFF9F9F9),
                    fontSize: responsive.ip(1.8),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFF9F9F9),
                    fontSize: responsive.ip(1.2),
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      )),
    );
  }
}
