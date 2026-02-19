import 'package:nacchofer31_portfolio/portfolio.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final projectList = context.select<HomeCubit, List<ProjectModel>>(
      (cubit) => cubit.state.homeModel.projects,
    );
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: cardBorderColor(context),
                width: 1,
              ),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    width: double.infinity,
                    padding: EdgeInsets.all(
                        Responsive.maxMainSpacing(context) * 1.333),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Projects',
                          style: Responsive.mainHeadline(context),
                        ),
                        SizedBox(height: Responsive.maxSmallSpacing(context)),
                        const AccentWidget(),
                      ],
                    ),
                  ),
                  Builder(builder: (context) {
                    double paddingSize = Responsive.isVerySmall(context)
                        ? 4
                        : Responsive.maxMainSpacing(context) * 1.333;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingSize)
                          .copyWith(
                        bottom: paddingSize,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: projectList.length,
                        itemBuilder: (context, index) {
                          final item = projectList[index];
                          return ScrollAppearanceTransition(
                              child: ProjectItem(projectData: item));
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          const FooterView(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
