import 'package:flutter_svg/svg.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    super.key,
    required this.iconPath,
    required this.url,
    this.tooltip,
    this.size = 20,
    this.padding = 10,
  });

  final String iconPath;
  final String url;
  final String? tooltip;
  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Tooltip(
        message: tooltip ?? (url.contains('linkedin') ? 'LinkedIn' : 'GitHub'),
        child: InkWell(
          onTap: () => launchUrl(Uri.parse(url)),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              border: Border.all(
                color: accentColor.withValues(alpha: 0.3),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              iconPath,
              height: size,
              width: size,
              colorFilter: ColorFilter.mode(accentColor, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
