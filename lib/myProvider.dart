import 'dart:math';

import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  double height = 180;
  int weight = 0;
  int age = 0;
  double bmi = 0;

  changeWidthSlider(double newValue) {
    height = newValue;
    notifyListeners();
  }

  void increaseweght() {
    weight++;
    notifyListeners();
  }

  void increaseage() {
    age++;
    notifyListeners();
  }

  void decreaseweght() {
    if (weight > 0) {
      weight--;
    }
    notifyListeners();
  }

  void decreaseage() {
    if (age > 0) {
      age--;
    }

    notifyListeners();
  }

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return 'You have higher than normal body weight. Try exercising more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!.';
    } else {
      return 'You have lower than normal body weight. You can eat bit more.';
    }
  }

  void restart() {
    weight = 0;
    height = 180;
    age = 0;
    bmi = 0;
  }
}
