import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

enum ProjectLinkType {
  appstore,
  playstore,
  web,
}

extension on ProjectLinkType {
  static final linkIconMap = {
    ProjectLinkType.appstore: 'assets/images/appstore.svg',
    ProjectLinkType.playstore: 'assets/images/playstore.svg',
    ProjectLinkType.web: 'assets/images/web.svg',
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
    return IconButton(
      onPressed: () => launchUrl(Uri.parse(link)),
      icon: SvgPicture.asset(height: 35, type.icon),
    );
  }
}
