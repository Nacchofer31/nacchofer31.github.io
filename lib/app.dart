import 'package:google_fonts/google_fonts.dart';
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

            final baseTheme = ThemeData(
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
              cardTheme: CardThemeData(
                color: cardColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(
                    width: 1,
                    color: isDarkMode
                        ? const Color(0xff383838)
                        : Colors.grey.withValues(alpha: 0.2),
                  ),
                ),
                margin: const EdgeInsets.all(12),
              ),
              tabBarTheme: TabBarThemeData(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: primary,
                unselectedLabelColor: isDarkMode
                    ? const Color.fromARGB(255, 209, 209, 209)
                    : const Color.fromARGB(255, 51, 51, 51),
              ),
            );

            return MultiBlocProvider(
              providers: [
                BlocProvider<HomeCubit>(
                  create: (_) => GetIt.instance.get<HomeCubit>(),
                ),
                BlocProvider<MailCubit>(
                  create: (_) => GetIt.instance.get<MailCubit>(),
                ),
              ],
              child: MaterialApp(
                title: 'Ignacio Ferrer Sanz | Mobile Engineer',
                theme: baseTheme.copyWith(
                  textTheme: GoogleFonts.poppinsTextTheme(
                    baseTheme.textTheme,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                scrollBehavior: CustomScrollBehavior(),
                onGenerateRoute: generateRoute,
                initialRoute: Routes.about.path,
                onUnknownRoute: (_) => MaterialPageRoute(
                  settings: const RouteSettings(name: '/about'),
                  builder: (_) => const HomePage(),
                ),
              ),
            );
          },
        ),
      );
}
