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
              'About Me 👤',
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
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Social Links:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                IconButton(
                  onPressed: () => launchUrl(Uri.parse(
                      'https://www.linkedin.com/in/ignacio-ferrer-sanz/')),
                  icon: SvgPicture.asset(
                    height: 35,
                    width: 35,
                    'assets/images/linkedin.svg',
                    colorFilter:
                        ColorFilter.mode(accentColor(context), BlendMode.dstIn),
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      launchUrl(Uri.parse('https://github.com/Nacchofer31')),
                  icon: SvgPicture.asset(
                    height: 35,
                    width: 35,
                    'assets/images/github.svg',
                    colorFilter:
                        ColorFilter.mode(accentColor(context), BlendMode.dstIn),
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () async => await _launchUrl(
                  'https://github.com/Nacchofer31/CV/raw/master/CV.pdf'),
              child: const Padding(
                padding: EdgeInsets.all(1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.download,
                    ),
                    Padding(
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
