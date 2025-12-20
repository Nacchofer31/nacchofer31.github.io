import 'package:nacchofer31_portfolio/portfolio.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  DependencyInjector.init();

  runApp(
    MyApp(
      controllers: [
        ThemeController(),
      ],
    ),
  );
}
