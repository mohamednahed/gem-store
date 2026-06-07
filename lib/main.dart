import 'package:flutter/material.dart';
import 'package:gem_store/screens/auth/LogInScreen.dart';
import 'package:gem_store/screens/onboarding/OnboardingScreen.dart';
import 'package:gem_store/screens/mainBottomNavbarScreens/BottmNavBar.dart';
import 'package:gem_store/screens/welcome/Intro1.dart';
import 'package:gem_store/screens/welcome/Intro2.dart';
import 'package:gem_store/screens/welcome/Intro3.dart';
import 'package:gem_store/screens/welcome/WelcomeScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gem Store',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:     const Login());
  }
  
}
