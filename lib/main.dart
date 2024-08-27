import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  DependencyInjector.init();

  runApp(
    MyApp(
      controllers: [
        ThemeController(),
        DataController(ContentDataSource()),
      ],
    ),
  );
}
