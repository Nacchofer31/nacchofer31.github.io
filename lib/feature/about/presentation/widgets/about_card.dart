import 'package:nacchofer31_portfolio/portfolio.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutModel = context.select<HomeCubit, AboutModel>(
      (cubit) => cubit.state.homeModel.aboutModel,
    );

    final highlights = aboutModel.description
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .map((line) => line.startsWith('-') ? line.substring(1).trim() : line)
        .toList();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: cardBorderColor(context),
          width: 1,
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.5),
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
            SizedBox(height: Responsive.maxLargeSpacing(context)),
            ...highlights
                .map((highlight) => PortfolioBulletPoint(text: highlight)),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Connect with me:',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(width: 12),
                    const SocialIconButton(
                      iconPath: 'assets/images/linkedin.svg',
                      url: 'https://www.linkedin.com/in/ignacio-ferrer-sanz/',
                      tooltip: 'LinkedIn',
                    ),
                    const SocialIconButton(
                      iconPath: 'assets/images/github.svg',
                      url: 'https://github.com/Nacchofer31',
                      tooltip: 'GitHub',
                    ),
                  ],
                ),
                FilledButton.icon(
                  onPressed: () async => await _launchUrl(
                      'https://github.com/Nacchofer31/CV/raw/master/CV.pdf'),
                  style: FilledButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  icon: const Icon(Icons.download, size: 20),
                  label: const Text(
                    'Download Resume',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
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
