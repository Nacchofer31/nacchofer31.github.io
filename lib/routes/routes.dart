import 'package:nacchofer31_portfolio/portfolio.dart';

enum Routes {
  about('/about'),
  experience('/experience'),
  education('/education'),
  projects('/projects'),
  contact('/contact');

  final String path;

  const Routes(this.path);

  static Routes? fromValue(String routeName) =>
      Routes.values.firstWhere((value) => value.path == routeName);
}

extension RouteExtension on Routes {
  static final routeNamesMap = {
    Routes.about: 'About',
    Routes.education: 'Education',
    Routes.experience: 'Experience',
    Routes.projects: 'Projects',
    Routes.contact: 'Contact me',
  };

  static final routeIconsMap = {
    Routes.about: Icons.person_outline,
    Routes.education: Icons.school_outlined,
    Routes.experience: Icons.work_outline,
    Routes.projects: Icons.terminal_outlined,
    Routes.contact: Icons.email_outlined,
  };

  String get description => routeNamesMap[this] ?? '';
  IconData get icon => routeIconsMap[this] ?? Icons.person_outline;
}


Route<dynamic> generateRoute(RouteSettings settings) {
  final int? routeIndex = Routes.fromValue(settings.name ?? '')?.index;
  return PageRouteBuilder(
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
    pageBuilder: (_, __, ___) => routeIndex != null
        ? HomePage(index: routeIndex)
        : const NotFoundRoute(),
  );
}
