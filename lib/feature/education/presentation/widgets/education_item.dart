import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class EducationItem extends StatelessWidget {
  const EducationItem({super.key, required this.educationData});

  final EducationModel educationData;

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
                      educationData.icon,
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
                        educationData.collegeName,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        educationData.date,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: isVerySmall ? 0 : 8),
                      isVerySmall
                          ? const SizedBox.shrink()
                          : Text(
                              educationData.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                    ],
                  ),
                ),
              ],
            ),
            ...isVerySmall
                ? [
                    const SizedBox(height: 18),
                    Text(
                      educationData.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]
                : [],
          ],
        ),
      ),
    );
  }
}
