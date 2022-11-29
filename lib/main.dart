import 'package:flutter/material.dart';
import 'package:project_mobile/main_screen.dart';
import 'package:project_mobile/page/page_characters.dart';
import 'package:project_mobile/page_login.dart';
import 'package:project_mobile/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi',
      home: SplashScreen(),
    );
  }
}
