import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

enum Routes {
  about('/about'),
  experience('/experience'),
  education('/education'),
  projects('/projects');

  final String path;

  const Routes(this.path);

  static Routes? fromValue(String routeName) =>
      Routes.values.firstWhere((value) => value.path == routeName);
}

Route<dynamic> generateRoute(RouteSettings settings) {
  final int? routeIndex = Routes.fromValue(settings.name ?? '')?.index;
  return PageRouteBuilder(
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
    pageBuilder: (_, __, ___) => routeIndex != null
        ? BlocProvider<HomeCubit>(
            create: (context) => GetIt.instance.get<HomeCubit>(),
            child: HomePage(index: routeIndex))
        : const NotFoundRoute(),
  );
}
