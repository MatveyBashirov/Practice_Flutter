import 'package:flutter/material.dart';

class AppData {
  Color backColor;

  AppData({required this.backColor});

  void changeBackground(Color newColor){
    backColor = newColor;
  }
}