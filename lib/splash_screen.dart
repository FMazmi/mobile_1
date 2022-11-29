import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_mobile/main_screen.dart';
import 'package:project_mobile/page_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ); // Material App
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color.fromARGB(255, 76, 57, 245),
      splash: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
              "assets/image/logo_hp.png",
              height: 160,
              width: 380,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              "PROJECT",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "Faruk Muhammad Azmi | 08",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              "Muammar Saddam Sirojudin A | 05",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              "Prak Mobile SI-C",
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
      ),
      nextScreen: PageLogin(),
      splashIconSize: 350,
      duration: 1000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
