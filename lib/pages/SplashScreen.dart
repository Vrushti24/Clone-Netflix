import 'package:demos/pages/HomePage.dart';
import 'package:demos/pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: Login(),
      backgroundColor: Colors.black87,
      splash: 'icons/full-logo.png',
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
