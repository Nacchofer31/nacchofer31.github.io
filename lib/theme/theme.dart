import 'package:flutter/material.dart';

Color cardBackground(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return isDarkMode
      ? const Color(0xff323232)
      : const Color.fromARGB(255, 218, 218, 218);
}

Color cardBorderColor(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return const Color(0xff383838).withValues(alpha: isDarkMode ? 1 : 0.2);
}

Color get accentColor => const Color(0xff2f486d);

Color brandDomainColor(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return isDarkMode ? const Color(0xff8ab4f8) : accentColor;
}

Color bodyTextColor(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return isDarkMode
      ? const Color.fromARGB(255, 194, 194, 194)
      : const Color.fromARGB(255, 32, 32, 32);
}
