import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:nacchofer31_portfolio/base/controller.dart';
import 'package:nacchofer31_portfolio/base/provider.dart';
import 'package:nacchofer31_portfolio/controllers/data_controller.dart';
import 'package:nacchofer31_portfolio/controllers/theme_controller.dart';
import 'package:nacchofer31_portfolio/data/content_datasource.dart';
import 'package:nacchofer31_portfolio/presentation/pages/home_page.dart';
import 'package:nacchofer31_portfolio/presentation/pages/not_found_page.dart';
import 'package:nacchofer31_portfolio/presentation/routes/routes.dart';
import 'package:nacchofer31_portfolio/utils/custom_scroll_behaviour.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp(controllers: [
    ThemeController(),
    DataController(ContentDataSource()),
  ]));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.controllers});

  final List<Controller> controllers;

  ThemeController get themeController {
    return controllers.firstWhere((controller) => controller is ThemeController)
        as ThemeController;
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      controllers: controllers,
      child: StreamBuilder(
        stream: themeController.state,
        builder: (context, snapshot) {
          final isDarkMode = themeController.isDarkMode;
          final primary = isDarkMode ? Colors.pinkAccent : Colors.pink;
          final cardColor = isDarkMode ? Color(0xff1E1E1F) : Colors.white;
          return MaterialApp(
            title: 'Ignacio Ferrer',
            theme: ThemeData(
              primarySwatch: Colors.pink,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
              iconTheme: IconThemeData(
                color: primary,
              ),
              scaffoldBackgroundColor: isDarkMode
                  ? Color(0xff121212)
                  : Color.fromARGB(255, 247, 247, 247),
              textTheme: TextTheme(
                button: TextStyle(
                  color: primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(18)),
                ),
              ),
              cardTheme: CardTheme(
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(
                      width: 1,
                      color:
                          Color(0xff383838).withOpacity(isDarkMode ? 1 : 0.1)),
                ),
                elevation: 0,
                margin: EdgeInsets.all(12),
              ),
              tabBarTheme: TabBarTheme(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: primary,
                unselectedLabelColor: isDarkMode
                    ? Color.fromARGB(255, 209, 209, 209)
                    : Color.fromARGB(255, 51, 51, 51),
              ),
            ),
            debugShowCheckedModeBanner: false,
            scrollBehavior: CustomScrollBehavior(),
            routes: routes,
            initialRoute: "/about",
            onUnknownRoute: (_) => MaterialPageRoute(
                builder: (_) => HomePage(child: NotFoundRoute())),
          );
        },
      ),
    );
  }
}

int getRouteIndex(String name) {
  return routes.keys.toList().indexWhere((x) => x == name);
}
