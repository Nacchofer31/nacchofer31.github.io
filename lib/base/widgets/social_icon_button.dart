import 'package:flutter_svg/svg.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatefulWidget {
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
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = brandDomainColor(context);
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Tooltip(
        message: widget.tooltip ??
            (widget.url.contains('linkedin') ? 'LinkedIn' : 'GitHub'),
        child: InkWell(
          onTap: () => launchUrl(Uri.parse(widget.url)),
          onHover: (hovered) => setState(() => _isHovered = hovered),
          borderRadius: BorderRadius.circular(12),
          hoverColor: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.all(widget.padding),
            decoration: BoxDecoration(
              color: color.withValues(alpha: _isHovered ? 0.25 : 0.12),
              border: Border.all(
                color: color.withValues(alpha: _isHovered ? 0.8 : 0.35),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              widget.iconPath,
              height: widget.size,
              width: widget.size,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
