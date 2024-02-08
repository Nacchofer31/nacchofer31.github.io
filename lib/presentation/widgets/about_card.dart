import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/base/provider.dart';
import 'package:nacchofer31_portfolio/controllers/data_controller.dart';
import 'package:nacchofer31_portfolio/presentation/theme/theme.dart';
import 'package:nacchofer31_portfolio/presentation/widgets/accent_indicator.dart';
import 'package:nacchofer31_portfolio/utils/responsive_screen.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    return Card(
      child: StreamBuilder(
        stream: dataController.state,
        builder: (context, snapshot) {
          final about = dataController.aboutModel;
          return AnimatedContainer(
            duration: Duration(milliseconds: 350),
            width: double.infinity,
            padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "About Me",
                  style: Responsive.mainHeadline(context),
                ),
                SizedBox(height: Responsive.maxSmallSpacing(context)),
                AccentWidget(),
                SizedBox(height: Responsive.maxSmallSpacing(context)),
                Text(
                  about.description,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        height: 1.8,
                        color: bodyTextColor(context),
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
