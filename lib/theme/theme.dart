import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/base/provider.dart';
import 'package:nacchofer31_portfolio/controllers/theme_controller.dart';

Color cardBackground(BuildContext context) {
  final isDarkMode = Provider.of<ThemeController>(context).isDarkMode;
  return isDarkMode
      ? const Color(0xff323232)
      : const Color.fromARGB(255, 218, 218, 218);
}

Color cardBorderColor(BuildContext context) {
  final isDarkMode = Provider.of<ThemeController>(context).isDarkMode;
  return const Color(0xff383838).withValues(alpha: isDarkMode ? 1 : 0.2);
}

Color get accentColor => const Color(0xff23395d);

Color bodyTextColor(BuildContext context) {
  final isDarkMode = Provider.of<ThemeController>(context).isDarkMode;
  return isDarkMode
      ? const Color.fromARGB(255, 194, 194, 194)
      : const Color.fromARGB(255, 32, 32, 32);
}
