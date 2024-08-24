import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({
    super.key,
    required this.experienceData,
  });

  final ExperienceModel experienceData;

  @override
  Widget build(BuildContext context) {
    final isVerySmall = Responsive.isVerySmall(context);
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: isVerySmall
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      experienceData.icon,
                      width: 56,
                      height: 56,
                    ),
                  ),
                ),
                SizedBox(width: Responsive.maxSmallSpacing(context)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        experienceData.clientName,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        experienceData.date,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: isVerySmall ? 0 : 8),
                      isVerySmall
                          ? const SizedBox()
                          : Text(
                              experienceData.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                      SizedBox(height: isVerySmall ? 0 : 18),
                      isVerySmall
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: experienceData.tasks
                                  .map((e) => ExperienceTask(
                                      name: e.name, description: e.description))
                                  .toList(),
                            ),
                    ],
                  ),
                ),
              ],
            ),
            ...isVerySmall
                ? [
                    const SizedBox(height: 18),
                    Text(
                      experienceData.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: experienceData.tasks
                          .map((e) => ExperienceTask(
                              name: e.name, description: e.description))
                          .toList(),
                    ),
                  ]
                : [],
          ],
        ),
      ),
    );
  }
}
