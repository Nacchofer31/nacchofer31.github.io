import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(
    MyApp(
      controllers: [
        ThemeController(),
        DataController(ContentDataSource()),
      ],
    ),
  );
}
