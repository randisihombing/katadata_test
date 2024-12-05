import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:test_tehnical/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          splash: Column(
            children: [
              Image.asset(
                "assets/images/splash_screen.png",
                height: 250,
              ),
              const SizedBox(height: 10,),
              const Text(
                "KATADATA Indonesia",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          nextScreen: const Home(),
          splashIconSize: 350,
        ),
      ),
    );
  }
}
