import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/base/provider.dart';
import 'package:nacchofer31_portfolio/controllers/data_controller.dart';
import 'package:nacchofer31_portfolio/controllers/theme_controller.dart';
import 'package:nacchofer31_portfolio/presentation/pages/about_page.dart';
import 'package:nacchofer31_portfolio/presentation/pages/not_found_page.dart';
import 'package:nacchofer31_portfolio/presentation/theme/theme.dart';
import 'package:nacchofer31_portfolio/utils/responsive_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    this.index = 0,
    this.child,
  }) : super(key: key);

  final int index;
  final Widget? child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int get routeIndex {
    return widget.index.clamp(0, 3);
  }

  int selectedMenu = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabController =
        TabController(length: 4, vsync: this, initialIndex: routeIndex);

    Provider.of<DataController>(context).loadAllData();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    return StreamBuilder(
      stream: themeController.state,
      builder: (context, snapshot) {
        final isMediumScreenOrSmaller =
            Responsive.isMediumScreenOrSmaller(context);
        return Scaffold(
          body: Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(Responsive.maxLargeSpacing(context)),
                  width: Responsive.maxContainerWidth(context, 800),
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: isMediumScreenOrSmaller
                                  ? Alignment.centerLeft
                                  : Alignment.center,
                              child: TabBar(
                                controller: tabController,
                                isScrollable: true,
                                physics: BouncingScrollPhysics(),
                                indicatorColor: accentColor(context),
                                tabs: [
                                  Tab(
                                    text: "About",
                                  ),
                                  Tab(
                                    text: "Portfolio",
                                  ),
                                  Tab(
                                    text: "Experience",
                                  ),
                                  Tab(
                                    text: "Education",
                                  ),
                                ],
                                onTap: (index) {
                                  switch (index) {
                                    case 0:
                                      Navigator.pushNamed(context, "/about");
                                      break;
                                    case 1:
                                      Navigator.pushNamed(
                                          context, "/portfolio");
                                      break;
                                    case 2:
                                      Navigator.pushNamed(
                                          context, "/experience");
                                      break;
                                    case 3:
                                      Navigator.pushNamed(
                                          context, "/education");
                                      break;
                                    default:
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: isMediumScreenOrSmaller ? 64 : 0),
                        ],
                      ),
                      SizedBox(height: 24),
                      Expanded(
                        child: widget.child ??
                            TabBarView(
                              controller: tabController,
                              children: [
                                AboutPage(),
                                NotFoundRoute(),
                                NotFoundRoute(),
                                NotFoundRoute(),
                              ],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Responsive.maxLargeSpacing(context)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      themeController.toogle();
                    },
                    icon: Icon(
                      themeController.isDarkMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
