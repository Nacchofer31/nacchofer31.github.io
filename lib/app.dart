import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.controllers});

  final List<Controller> controllers;

  ThemeController get themeController {
    return controllers.firstWhere((controller) => controller is ThemeController)
        as ThemeController;
  }

  @override
  Widget build(BuildContext context) => Provider(
        controllers: controllers,
        child: StreamBuilder(
          stream: themeController.state,
          builder: (context, snapshot) {
            final isDarkMode = themeController.isDarkMode;
            const primary = Colors.blue;
            final cardColor =
                isDarkMode ? const Color(0xff1E1E1F) : Colors.white;
            return MaterialApp(
              title: 'Ignacio Ferrer',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                brightness: isDarkMode ? Brightness.dark : Brightness.light,
                iconTheme: const IconThemeData(
                  color: primary,
                ),
                scaffoldBackgroundColor: isDarkMode
                    ? const Color(0xff121212)
                    : const Color.fromARGB(255, 247, 247, 247),
                textButtonTheme: const TextButtonThemeData(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(18)),
                  ),
                ),
                cardTheme: CardTheme(
                  color: cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(
                        width: 1,
                        color: const Color(0xff383838)
                            .withOpacity(isDarkMode ? 1 : 0.1)),
                  ),
                  elevation: 0,
                  margin: const EdgeInsets.all(12),
                ),
                tabBarTheme: TabBarTheme(
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: primary,
                  unselectedLabelColor: isDarkMode
                      ? const Color.fromARGB(255, 209, 209, 209)
                      : const Color.fromARGB(255, 51, 51, 51),
                ),
              ),
              debugShowCheckedModeBanner: false,
              scrollBehavior: CustomScrollBehavior(),
              onGenerateRoute: generateRoute,
              initialRoute: '/about',
              onUnknownRoute: (_) => MaterialPageRoute(
                builder: (_) => const HomePage(
                  child: NotFoundRoute(),
                ),
              ),
            );
          },
        ),
      );
}
