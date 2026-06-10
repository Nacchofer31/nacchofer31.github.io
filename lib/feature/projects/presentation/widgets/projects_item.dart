import 'dart:ui';

import 'package:hexcolor/hexcolor.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.projectData});

  final ProjectModel projectData;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final projectColor = HexColor(projectData.iconColor);
    final skillTags = projectData.skills
        .split(',')
        .map((tag) => tag.trim())
        .where((tag) => tag.isNotEmpty)
        .toList();
    final hasLinks = projectData.appStoreLink != null ||
        projectData.playStoreLink != null ||
        projectData.webLink != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color(0xff252526)
            : const Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: cardBorderColor(context),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      projectData.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      projectData.type,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: bodyTextColor(context),
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: Responsive.maxSmallSpacing(context)),
              Tooltip(
                message: 'Built with',
                child: SkillIcon(
                  iconPath: projectData.techIcon,
                  iconColor: projectData.iconColor,
                  size: 40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            projectData.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skillTags
                .map((tag) => PortfolioTag(
                      label: tag,
                      color: projectColor,
                    ))
                .toList(),
          ),
          Container(
            height: 500,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ScrollConfiguration(
              behavior: const MaterialScrollBehavior().copyWith(dragDevices: {
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
          if (hasLinks)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Links:',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 12),
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
                    type: ProjectLinkType.website,
                    link: projectData.webLink!,
                  )
              ],
            ),
        ],
      ),
    );
  }
}
