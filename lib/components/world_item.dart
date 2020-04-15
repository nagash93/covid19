import 'package:covid19_app/util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorldItem extends StatelessWidget {
  final formatter = new NumberFormat("#,###");

  final String title;
  final IconData icon;
  final Color color;
  final int count;

  WorldItem(this.title, this.icon, this.color, this.count);

  @override
  Widget build(BuildContext context) {

    final responsive = Responsive(context);
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      width: responsive.ip(15),
      height: responsive.ip(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.primaryColorDark,
        /*gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF8F5FE),
            Color(0xFFFDFCFE),
          ],
        ),*/
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 3.0,
            spreadRadius: 1.0,
            offset: Offset(
              0.3,
              1.0,
            ),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon,
              size: responsive.ip(5),
            color: color,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${formatter.format(count)}',

            style: TextStyle(fontSize: responsive.ip(2),
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: responsive.ip(1.6),
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}
