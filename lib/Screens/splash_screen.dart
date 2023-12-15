import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navbar/Screens/HomePage.dart';
import 'package:navbar/Screens/phone.dart';
import 'package:navbar/common/models/user.dart';
import 'package:navbar/utils/hive_service.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  HiveService hiveService = HiveService();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
    Timer(Duration(seconds: 1), () {
      _navigatetohome();
    });
  }

  _navigatetohome() async {
    // checking if user information is present

    // if present navigate to homePage
    // now sending this ID to a API if there is no token in the system

    await hiveService.init();
    bool exists = await hiveService.isExists(boxName: 'user_data');

    if( exists ) {
      final List<User> userData = await hiveService.getBoxes<User>('user_data');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(phoneNumber: userData.first.number),
        )
      );
    }
    else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          )
      );
    }
    // else navigate to registration page
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
