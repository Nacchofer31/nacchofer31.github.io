import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.projectData});

  final ProjectModel projectData;

  @override
  Widget build(BuildContext context) {
    final isVerySmall = Responsive.isVerySmall(context);
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      projectData.logo,
                      width: 56,
                      height: 56,
                    ),
                  ),
                ),
                SizedBox(width: Responsive.maxSmallSpacing(context)),
                Flexible(
                  child: Text(
                    projectData.name.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projectData.type,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: isVerySmall ? 0 : 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'DESCRIPTION: ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: projectData.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isVerySmall ? 0 : 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'SKILLS: ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: projectData.skills,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isVerySmall ? 0 : 8),
                  Row(
                    children: [
                      Text(
                        'Built with:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 5),
                      SkillIcon(
                        iconPath: projectData.techIcon,
                        iconColor: projectData.iconColor,
                        size: 40,
                      ),
                    ],
                  ),
                  Container(
                    height: 500,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ScrollConfiguration(
                      behavior:
                          const MaterialScrollBehavior().copyWith(dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.trackpad,
                        PointerDeviceKind.stylus,
                        PointerDeviceKind.invertedStylus,
                        PointerDeviceKind.unknown,
                      }),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: projectData.screenshots
                            .map(
                              (screenshot) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    height: 500,
                                    screenshot,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Links:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 5),
                      if (projectData.appStoreLink != null)
                        LinkWidget(
                          type: ProjectLinkType.appstore,
                          link: projectData.appStoreLink!,
                        ),
                      if (projectData.playStoreLink != null)
                        LinkWidget(
                          type: ProjectLinkType.playstore,
                          link: projectData.playStoreLink!,
                        ),
                      if (projectData.webLink != null)
                        LinkWidget(
                          type: ProjectLinkType.web,
                          link: projectData.webLink!,
                        )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
