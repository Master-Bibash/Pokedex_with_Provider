import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/HomePage/Mainhome.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = '/spalsh-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF200F51),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Color(0xFF200F51),
              alignment: Alignment.bottomCenter,
              child: LottieBuilder.asset(
                "assets/animation/splash.json",
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            AnimatedTextKit(
                onFinished: () {
                  Navigator.pushReplacementNamed(context, MainHomePage.routeName);
                },
                animatedTexts: [
                  TyperAnimatedText(
                      textAlign: TextAlign.center,
                      speed: Duration(microseconds: 10),
                      "Loading",
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ]),
          ],
        ));
  }
}
