import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/feature/home/presentation/page/home_page.dart';
import 'package:nacchofer31_portfolio/feature/not_found/presentation/page/not_found_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final Map<String, int> routes = {
    '/about': 0,
    '/experience': 1,
    '/education': 2,
  };

  final int? index = routes[settings.name];
  return PageRouteBuilder(
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
    pageBuilder: (_, __, ___) =>
        index != null ? HomePage(index: index) : const NotFoundRoute(),
  );
}
