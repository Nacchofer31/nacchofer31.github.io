import 'package:flutter/services.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.index = 0,
  });

  final int index;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get routeIndex {
    return widget.index.clamp(0, 4);
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: Routes.values.length,
      vsync: this,
      initialIndex: routeIndex,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<HomeCubit>();
      if (cubit.state.selectedPage.index != routeIndex) {
        cubit.changePage(Routes.values[routeIndex]);
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    return BlocListener<HomeCubit, HomeState>(
        listenWhen: (previous, current) =>
            previous.selectedPage != current.selectedPage,
        listener: (context, state) {
          final index = state.selectedPage.index;
          if (tabController.index != index) {
            tabController.animateTo(index);
          }
          SystemNavigator.routeInformationUpdated(
            uri: Uri.parse(state.selectedPage.path),
            replace: true,
          );
        },
        child: StreamBuilder(
          stream: themeController.state,
          builder: (context, snapshot) {
            final homeModel = context.select<HomeCubit, HomeModel>(
              (cubit) => cubit.state.homeModel,
            );
            final skillAssets =
                homeModel.skillList.map((skill) => skill.techLogoPath).toList();

            return SelectionArea(
              child: Scaffold(
                key: _scaffoldKey,
                drawer: const HomeDrawer(),
                body: ThemedPatternBackground(
                  skillAssets: skillAssets,
                  child: Center(
                    child: Container(
                      padding:
                          EdgeInsets.all(Responsive.maxLargeSpacing(context))
                              .copyWith(bottom: 0),
                      width: Responsive.maxContainerWidth(context, 1400),
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TopNavigationBar(
                            tabController: tabController,
                            onMenuPressed: () =>
                                _scaffoldKey.currentState?.openDrawer(),
                          ),
                          Expanded(
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: tabController,
                              children: const [
                                AboutPage(),
                                ExperiencePage(),
                                EducationPage(),
                                ProjectsPage(),
                                ContactPage(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}
