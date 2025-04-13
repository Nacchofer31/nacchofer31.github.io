import 'package:flutter/material.dart';

class ThemeProvider {
  final ValueNotifier<bool> darkMode = ValueNotifier<bool>(true);

  bool get isDarkMode => darkMode.value;
  void toogleValue() {
    darkMode.value = !darkMode.value;
  }
}
