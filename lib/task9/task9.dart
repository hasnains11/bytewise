import 'package:flutter/material.dart';

class TweenAnimation extends StatelessWidget {
  const TweenAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: TweenAnimationBuilder(
          duration: Duration(seconds: 3),
          tween: Tween<double>(begin: 50.0, end: 0.0),
          builder: (BuildContext context, double value, Widget? child) {
            return RotationTransition(
              turns: AlwaysStoppedAnimation(value),
              child: child,
            );
          },
          child: Text(
            'Hello World',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ));
  }
}
