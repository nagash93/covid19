import 'package:covid19_app/providers/covid_provider.dart';
import 'package:covid19_app/util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Loading extends StatefulWidget {
  CovidProvider _covidProvider;

  Loading(this._covidProvider);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  AnimationController _controller;
  Responsive responsive;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.forward();
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Icon(
              FontAwesomeIcons.virus,
              color: Theme.of(context).accentColor,
              size: responsive.ip(15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          !widget._covidProvider.error
              ? Text(
                  "Cargando...",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: responsive.ip(2),
                      fontWeight: FontWeight.bold),
                )
              : error()
        ],
      ),
    );
  }

  Widget error() {
    _controller.stop();

    return Column(
      children: <Widget>[
        Text(
          "Algo salio mal :(",
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: responsive.ip(2),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () {
              _controller.forward();
              widget._covidProvider.loadData();
            },
            child: Text(
              "¿Reintentar?",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: responsive.ip(2),
                  fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline
              ),
            )),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
