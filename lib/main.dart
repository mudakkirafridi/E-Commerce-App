import 'package:e_commerce_app/admin/admin_login.dart';
import 'package:e_commerce_app/admin/food_add_screen.dart';
import 'package:e_commerce_app/admin/home.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/pages/bottom_nav.dart';
import 'package:e_commerce_app/pages/details.dart';
import 'package:e_commerce_app/pages/forgot_password.dart';
import 'package:e_commerce_app/pages/home.dart';
import 'package:e_commerce_app/pages/login.dart';
import 'package:e_commerce_app/pages/onboard.dart';
import 'package:e_commerce_app/pages/profile.dart';
import 'package:e_commerce_app/pages/signup.dart';
import 'package:e_commerce_app/pages/splash.dart';
import 'package:e_commerce_app/pages/wallet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 252, 251, 253)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
