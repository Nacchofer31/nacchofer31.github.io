import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    return Card(
      child: StreamBuilder(
        stream: dataController.state,
        builder: (context, snapshot) {
          final about = dataController.aboutModel;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width: double.infinity,
            padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'About Me',
                  style: Responsive.mainHeadline(context),
                ),
                SizedBox(height: Responsive.maxSmallSpacing(context)),
                const AccentWidget(),
                SizedBox(height: Responsive.maxSmallSpacing(context)),
                Text(
                  about.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
