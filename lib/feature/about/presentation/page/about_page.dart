import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) => const SingleChildScrollView(
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
