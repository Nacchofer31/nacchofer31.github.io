import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutModel = context.select<HomeCubit, AboutModel>(
      (cubit) => cubit.state.homeModel.aboutModel,
    );
    return Card(
      child: AnimatedContainer(
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
              aboutModel.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.8,
                    color: bodyTextColor(context),
                  ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Social Links:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () => launchUrl(Uri.parse(
                        'https://www.linkedin.com/in/ignacio-ferrer-sanz/')),
                    child: SvgPicture.asset(
                      height: 25,
                      width: 25,
                      'assets/images/linkedin.svg',
                      colorFilter:
                          ColorFilter.mode(accentColor, BlendMode.srcIn),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () =>
                        launchUrl(Uri.parse('https://github.com/Nacchofer31')),
                    child: SvgPicture.asset(
                      height: 25,
                      width: 25,
                      'assets/images/github.svg',
                      colorFilter:
                          ColorFilter.mode(accentColor, BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () async => await _launchUrl(
                  'https://github.com/Nacchofer31/CV/raw/master/CV.pdf'),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.download,
                      color: accentColor,
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Text('Download Resume')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @protected
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
