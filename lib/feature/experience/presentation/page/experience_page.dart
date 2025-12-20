import 'package:nacchofer31_portfolio/portfolio.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final experienceList = context.select<HomeCubit, List<ExperienceModel>>(
      (cubit) => cubit.state.homeModel.experienceList,
    );
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          'Experience',
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
                          : Responsive.maxMainSpacing(context) * 1.333,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: experienceList.length,
                      itemBuilder: (context, index) {
                        final item = experienceList[index];
                        return ScrollAppearanceTransition(
                            child: ExperienceItem(experienceData: item));
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
