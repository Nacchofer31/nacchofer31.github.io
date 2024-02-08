import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/base/provider.dart';
import 'package:nacchofer31_portfolio/controllers/data_controller.dart';
import 'package:nacchofer31_portfolio/presentation/theme/theme.dart';
import 'package:nacchofer31_portfolio/utils/responsive_screen.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    final isExtremelySmall = Responsive.isExtremelySmall(context);
    return Card(
      child: StreamBuilder(
        stream: dataController.state,
        builder: (context, snapshot) {
          final profile = dataController.profileModel;
          return AnimatedContainer(
            duration: Duration(milliseconds: 350),
            padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
            child: Row(
              mainAxisAlignment: isExtremelySmall
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                isExtremelySmall
                    ? SizedBox()
                    : AnimatedContainer(
                        duration: Duration(milliseconds: 350),
                        width: Responsive.maxSquareSize(context),
                        height: Responsive.maxSquareSize(context),
                        decoration: BoxDecoration(
                          color: cardBackground(context),
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: Image.asset(
                              profile.avatarPath,
                              width: Responsive.maxSquareSize(context),
                              height: Responsive.maxSquareSize(context),
                            ).image,
                          ),
                        ),
                      ),
                SizedBox(
                    width: isExtremelySmall
                        ? 0
                        : Responsive.maxMainSpacing(context)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      profile.fullName,
                      style: Responsive.mainHeadline(context),
                    ),
                    SizedBox(height: Responsive.maxSmallSpacing(context)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          profile.role,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    height: 1.8,
                                    color: bodyTextColor(context),
                                  ),
                        ),
                        SizedBox(width: 8),
                        !Responsive.isVerySmall(context)
                            ? SizedBox()
                            : AnimatedContainer(
                                duration: Duration(milliseconds: 350),
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: Image.network(
                                      profile.avatarPath,
                                      width: 24,
                                      height: 24,
                                    ).image,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
                isExtremelySmall ? SizedBox() : Spacer(),
                Responsive.isVerySmall(context)
                    ? SizedBox()
                    : AnimatedContainer(
                        duration: Duration(milliseconds: 350),
                        width: Responsive.maxSquareSize(context) * 0.65,
                        height: Responsive.maxSquareSize(context) * 0.65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.network(
                              profile.techUrl,
                              width: Responsive.maxSquareSize(context) * 0.65,
                              height: Responsive.maxSquareSize(context) * 0.65,
                            ).image,
                          ),
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
