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
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      width: responsive.wp(40),
      height: responsive.wp(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            Colors.white,
          ],
        ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: responsive.ip(5)),
          SizedBox(
            height: 10,
          ),
          Text(
            '${formatter.format(count)}',
            style: TextStyle(fontSize: responsive.ip(2), fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: responsive.ip(1.5),
            ),
          ),
        ],
      ),
    );
  }
}
