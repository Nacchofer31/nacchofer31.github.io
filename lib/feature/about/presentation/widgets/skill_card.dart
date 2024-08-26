import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    return Card(
      child: StreamBuilder(
        stream: dataController.state,
        builder: (context, snapshot) {
          final skills = dataController.skillList;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width: double.infinity,
            padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Skills',
                  style: Responsive.mainHeadline(context),
                ),
                SizedBox(height: Responsive.maxSmallSpacing(context)),
                const AccentWidget(),
                SizedBox(height: Responsive.maxSmallSpacing(context)),
                Column(
                  children: skills
                      .map((e) => _SkillItem(
                            skillData: e,
                          ))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SkillItem extends StatelessWidget {
  const _SkillItem({
    required this.skillData,
  });

  final SkillModel skillData;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 36,
              height: 36,
              child: Image.asset(
                skillData.techLogoPath,
                width: 36,
                height: 36,
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
                    skillData.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: Responsive.maxSmallSpacing(context) / 2),
                  Text(
                    skillData.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
