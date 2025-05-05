import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final profileModel = context.select<HomeCubit, ProfileModel>(
      (cubit) => cubit.state.homeModel.profileModel,
    );
    final isExtremelySmall = Responsive.isExtremelySmall(context);
    return AnimatedContainer(
      width: double.infinity,
      duration: const Duration(milliseconds: 350),
      padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
      child: Row(
        mainAxisAlignment: isExtremelySmall
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          isExtremelySmall
              ? const SizedBox.shrink()
              : AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  width: Responsive.maxSquareSize(context),
                  height: Responsive.maxSquareSize(context),
                  decoration: BoxDecoration(
                    color: cardBackground(context),
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: Image.asset(
                        profileModel.avatarPath,
                        width: Responsive.maxSquareSize(context),
                        height: Responsive.maxSquareSize(context),
                      ).image,
                    ),
                  ),
                ),
          SizedBox(
              width: isExtremelySmall ? 0 : Responsive.maxMainSpacing(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  profileModel.fullName,
                  style: Responsive.mainHeadline(context),
                ),
                SizedBox(height: Responsive.maxSmallSpacing(context)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      profileModel.role,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.8,
                            color: bodyTextColor(context),
                          ),
                    ),
                    const SizedBox(width: 8),
                    !Responsive.isVerySmall(context)
                        ? const SizedBox.shrink()
                        : AnimatedContainer(
                            duration: const Duration(milliseconds: 350),
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                image: Image.network(
                                  profileModel.avatarPath,
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
          ),
        ],
      ),
    );
  }
}
