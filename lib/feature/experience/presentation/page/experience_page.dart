import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Card(
        child: StreamBuilder(
          stream: dataController.state,
          builder: (context, snapshot) {
            List<ExperienceModel> experiences = dataController.experienceList;
            return AnimatedContainer(
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
                            : Responsive.maxMainSpacing(context) * 1.333),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: experiences
                          .map((e) => ExperienceItem(experienceData: e))
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
