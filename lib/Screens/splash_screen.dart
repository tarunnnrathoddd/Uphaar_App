import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navbar/Screens/HomePage.dart';
import 'package:navbar/Screens/phone.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
    Timer(Duration(seconds: 3), () {
      _navigatetohome();
    });
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _animation,
                  child: Image.asset(
                    'assets/uphaar.jpeg',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                SizedBox(height: 16.0),
                FadeTransition(
                  opacity: _animation,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
