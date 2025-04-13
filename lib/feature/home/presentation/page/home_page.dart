import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';
import 'package:url_launcher/url_launcher.dart';

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
      builder: (context, snapshot) => Scaffold(
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () async => await _launchUrl(
                          'https://github.com/Nacchofer31/CV/raw/master/CV.pdf'),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.download,
                            ),
                            !Responsive.isMediumScreenOrSmaller(context)
                                ? const Padding(
                                    padding: EdgeInsets.only(left: 3),
                                    child: Text('Download Resume'))
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () => themeController.toogle(),
                      icon: Icon(
                        themeController.isDarkMode
                            ? Icons.dark_mode
                            : Icons.light_mode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
