import 'package:nacchofer31_portfolio/portfolio.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final educationList = context.select<HomeCubit, List<EducationModel>>(
      (cubit) => cubit.state.homeModel.educationList,
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
                          'Education',
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
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: educationList.length,
                      itemBuilder: (context, index) {
                        final item = educationList[index];
                        return ScrollAppearanceTransition(
                            delay:
                                Duration(milliseconds: (300 * index).toInt()),
                            child: EducationItem(educationData: item));
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
