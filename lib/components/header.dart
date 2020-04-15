import 'package:covid19_app/util/responsive.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {


  final Widget title,subMenu;
  final IconData icon;
  final Color color;

  Header({this.title, this.subMenu, this.icon,this.color});

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    final responsive = Responsive(context);
    return   Container(
        width: responsive.wp(100),
    height: responsive.hp(30),
    decoration: BoxDecoration(
    color: theme.primaryColorDark,
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
    )),
    child:

    Stack(
      alignment: Alignment(-2, -1),
      children: <Widget>[
        Icon(
          icon,
          size: responsive.ip(25),
          color: color!=null?color:theme.accentColor.withOpacity(0.2),
        ),
        SafeArea(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                title!=null?title:Container(),
                subMenu!=null?subMenu:Container()
              ],
            )),

      ],
    ));
  }
}
