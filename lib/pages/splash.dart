import 'dart:async';

import 'package:e_commerce_app/pages/bottom_nav.dart';
import 'package:e_commerce_app/pages/home.dart';
import 'package:e_commerce_app/pages/signup.dart';
import 'package:e_commerce_app/widgets/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  isLogin() {
    if (FirebaseAuth.instance.currentUser != null) {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BottomNav()));
    } else {
      return Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      isLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/food.png',
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Food Delivery \n App',
            textAlign: TextAlign.center,
            style: AppWidget.headlineTextStyle().copyWith(
                color: const Color.fromARGB(255, 232, 229, 229),
                fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}
