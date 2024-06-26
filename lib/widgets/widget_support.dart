import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }

  static TextStyle headlineTextStyle() {
    return const TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }

  static TextStyle lightTextStyle() {
    return const TextStyle(
        fontSize: 15,
        color: Colors.black38,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins');
  }

  static TextStyle semiBoldTextStyle() {
    return const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins');
  }
}
