import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/presentation/widgets/about_card.dart';
import 'package:nacchofer31_portfolio/presentation/widgets/profile_card.dart';
import 'package:nacchofer31_portfolio/presentation/widgets/skill_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ProfileCard(),
          AboutCard(),
          SkillsCard(),
        ],
      ),
    );
  }
}
