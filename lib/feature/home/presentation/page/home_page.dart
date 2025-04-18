import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.index = 0,
    this.child,
  });

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

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: Routes.values.length,
      vsync: this,
      initialIndex: routeIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    return StreamBuilder(
      stream: themeController.state,
      builder: (context, snapshot) {
        var row = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => themeController.toogle(),
              icon: Icon(
                themeController.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
          ],
        );
        return Scaffold(
          body: Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(Responsive.maxLargeSpacing(context)),
                  width: Responsive.maxContainerWidth(context, 1400),
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TopNavigationBar(tabController: tabController),
                      const SizedBox(height: 24),
                      Expanded(
                        child: widget.child ??
                            TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: tabController,
                              children: const [
                                AboutPage(),
                                ExperiencePage(),
                                EducationPage(),
                                ProjectsPage(),
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
                  child: row,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
