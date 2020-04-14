import 'package:flutter/material.dart';
import 'dart:math';

class ArrowAnimation extends StatefulWidget {
  final bool state;
  final Function() changeOrder;


  ArrowAnimation(this.state, this.changeOrder);

  @override
  _ArrowAnimationState createState() => _ArrowAnimationState();
}

class _ArrowAnimationState extends State<ArrowAnimation>  with TickerProviderStateMixin{


  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;


  @override
  void initState() {
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widget.changeOrder();
    if (widget.state) {
      _arrowAnimation =
          Tween(begin: pi, end: 0.0).animate(_arrowAnimationController);

    } else {
      _arrowAnimation =
          Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   AnimatedBuilder(
        animation: _arrowAnimationController,
        builder: (context, child) => Transform.rotate(
          angle: _arrowAnimation.value,
          child: IconButton(
              icon: Icon(Icons.arrow_drop_up,size: 20,),
              onPressed: changeArrow),
        ),
        //  child:
      );
  }

  changeArrow(){

    widget.changeOrder();

    setState(() {
      _arrowAnimationController.isCompleted
          ? _arrowAnimationController.reverse()
          : _arrowAnimationController.forward();
    });


  }


  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController?.dispose();

  }
}

