import 'package:nacchofer31_portfolio/portfolio.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = context.select<HomeCubit, List<SkillModel>>(
      (cubit) => cubit.state.homeModel.skillList,
    );
    return Card(
      elevation: 0,
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
                  .map((e) => Card(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xff252526)
                            : const Color.fromARGB(255, 240, 240, 240),
                        elevation:
                            Theme.of(context).brightness == Brightness.dark
                                ? 4
                                : 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: _SkillItem(
                          skillData: e,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
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
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SkillIcon(
              iconPath: skillData.techLogoPath,
              iconColor: skillData.iconColor,
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
