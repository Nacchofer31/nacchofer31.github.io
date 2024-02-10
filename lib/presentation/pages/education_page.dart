import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/base/provider.dart';
import 'package:nacchofer31_portfolio/controllers/data_controller.dart';
import 'package:nacchofer31_portfolio/presentation/widgets/accent_indicator.dart';
import 'package:nacchofer31_portfolio/presentation/widgets/education_item.dart';
import 'package:nacchofer31_portfolio/utils/responsive_screen.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Card(
        child: StreamBuilder(
          stream: dataController.state,
          builder: (context, snapshot) {
            final experiences = dataController.educationList;
            return AnimatedContainer(
              duration: Duration(milliseconds: 350),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 350),
                    width: double.infinity,
                    padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Education",
                          style: Responsive.mainHeadline(context),
                        ),
                        SizedBox(height: Responsive.maxSmallSpacing(context)),
                        AccentWidget(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Responsive.isVerySmall(context) ? 4 : Responsive.maxMainSpacing(context) * 1.333),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: experiences.map((e) => EducationItem(educationData: e)).toList(),
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