import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

extension on Routes {
  static final routeNamesMap = {
    Routes.about: 'About',
    Routes.education: 'Education',
    Routes.experience: 'Experience',
    Routes.projects: 'Projects',
  };

  String get name => routeNamesMap[this] ?? '';
}

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
      children: [
        Expanded(
          child: Align(
            alignment: isMediumScreenOrSmaller
                ? Alignment.centerLeft
                : Alignment.center,
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorWeight: 5,
              physics: const BouncingScrollPhysics(),
              indicatorColor: accentColor,
              tabs: Routes.values
                  .map(
                    (e) => Tab(text: e.name),
                  )
                  .toList(),
              onTap: (index) =>
                  context.read<HomeCubit>().changePage(Routes.values[index]),
            ),
          ),
        ),
        SizedBox(width: isMediumScreenOrSmaller ? 64 : 0),
      ],
    );
  }
}
