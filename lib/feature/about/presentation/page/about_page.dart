import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';
import 'package:nacchofer31_portfolio/utils/slide_in_from_left.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SlideInFromLeft(
              delay: Duration(milliseconds: 300), child: ProfileCard()),
          SlideInFromLeft(
              delay: Duration(milliseconds: 600), child: AboutCard()),
          SlideInFromLeft(
              delay: Duration(milliseconds: 900), child: SkillsCard()),
          SlideInFromLeft(
              delay: Duration(milliseconds: 1200), child: FooterView()),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
