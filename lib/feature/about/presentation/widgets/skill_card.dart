import 'package:hexcolor/hexcolor.dart';
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
            SizedBox(height: Responsive.maxLargeSpacing(context)),
            LayoutBuilder(
              builder: (context, constraints) {
                const spacing = 16.0;
                final isWide = constraints.maxWidth >= 640;
                final itemWidth = isWide
                    ? (constraints.maxWidth - spacing) / 2
                    : constraints.maxWidth;
                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: skills
                      .map((skill) => SizedBox(
                            width: itemWidth,
                            child: _SkillItem(skillData: skill),
                          ))
                      .toList(),
                );
              },
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
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final techTags = skillData.description
        .split(RegExp(r'[,|]'))
        .map((tag) => tag.trim())
        .where((tag) => tag.isNotEmpty)
        .toList();

    return Container(
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
            children: [
              SkillIcon(
                iconPath: skillData.techLogoPath,
                iconColor: skillData.iconColor,
                size: 48,
              ),
              SizedBox(width: Responsive.maxSmallSpacing(context)),
              Expanded(
                child: Text(
                  skillData.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: Responsive.maxSmallSpacing(context) * 1.5),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: techTags
                .map((tag) => PortfolioTag(
                      label: tag,
                      color: HexColor(skillData.iconColor),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
