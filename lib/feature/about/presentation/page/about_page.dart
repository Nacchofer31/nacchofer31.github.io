import 'package:nacchofer31_portfolio/portfolio.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScrollAppearanceTransition(
              delay: Duration(milliseconds: 300), child: ProfileCard()),
          ScrollAppearanceTransition(
              delay: Duration(milliseconds: 600), child: AboutCard()),
          ScrollAppearanceTransition(
              delay: Duration(milliseconds: 900), child: SkillCard()),
          ScrollAppearanceTransition(child: ContactCTA()),
          FooterView(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
