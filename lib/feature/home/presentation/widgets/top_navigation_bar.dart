import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final isMediumScreenOrSmaller = Responsive.isMediumScreenOrSmaller(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Align(
            alignment: isMediumScreenOrSmaller
                ? Alignment.centerLeft
                : Alignment.center,
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              indicatorColor: accentColor(context),
              tabs: const [
                Tab(text: 'About'),
                Tab(text: 'Experience'),
                Tab(text: 'Education'),
              ],
              onTap: (index) => Navigator.pushNamed(context, index.routePath),
            ),
          ),
        ),
        SizedBox(width: isMediumScreenOrSmaller ? 64 : 0),
      ],
    );
  }
}

extension on int {
  static final _routes = {
    0: Routes.about,
    1: Routes.experience,
    2: Routes.education
  };

  String get routePath => _routes[this]?.path ?? '';
}
