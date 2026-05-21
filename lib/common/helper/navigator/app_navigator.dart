import 'package:flutter/material.dart';

class AppNavigator {

  static pushReplacement(BuildContext context, Widget widget){ // widget è la nostra page
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => widget)
    );
  }
}