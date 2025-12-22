import 'package:nacchofer31_portfolio/portfolio.dart';

enum ProjectLinkType {
  appstore,
  playstore,
  website,
}

extension on ProjectLinkType {
  static final linkIconMap = {
    ProjectLinkType.appstore: 'assets/images/appstore.svg',
    ProjectLinkType.playstore: 'assets/images/playstore.svg',
    ProjectLinkType.website: 'assets/images/web.svg',
  };

  String get icon => linkIconMap[this] ?? '';
}

class LinkWidget extends StatelessWidget {
  const LinkWidget({
    super.key,
    required this.type,
    required this.link,
  });

  final ProjectLinkType type;
  final String link;

  @override
  Widget build(BuildContext context) {
    return SocialIconButton(
      iconPath: type.icon,
      url: link,
      tooltip: type.name.toUpperCase(),
      size: 24,
      padding: 8,
    );
  }
}
