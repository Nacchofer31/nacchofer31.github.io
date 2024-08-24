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
    return widget.index.clamp(0, 2);
  }

  int selectedMenu = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: routeIndex,
    );

    Provider.of<DataController>(context).loadAllData();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    return StreamBuilder(
      stream: themeController.state,
      builder: (context, snapshot) {
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
                              controller: tabController,
                              children: const [
                                AboutPage(),
                                ExperiencePage(),
                                EducationPage(),
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
