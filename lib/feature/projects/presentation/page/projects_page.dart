import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';
import 'package:nacchofer31_portfolio/utils/slide_in_from_left.dart';

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
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.isVerySmall(context)
                            ? 4
                            : Responsive.maxMainSpacing(context) * 1.333),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: projectList.length,
                      itemBuilder: (context, index) {
                        final item = projectList[index];
                        return SlideInFromLeft(
                            delay:
                                Duration(milliseconds: (300 * index).toInt()),
                            child: ProjectItem(projectData: item));
                      },
                    ),
                  ),
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
