import 'package:nacchofer31_portfolio/portfolio.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({
    super.key,
    required this.tabController,
    this.onMenuPressed,
  });

  final TabController tabController;
  final VoidCallback? onMenuPressed;

  @override
  Widget build(BuildContext context) {
    final isMediumScreenOrSmaller = Responsive.isMediumScreenOrSmaller(context);
    return Row(
      children: [
        if (isMediumScreenOrSmaller)
          IconButton(
            onPressed: onMenuPressed,
            icon: const Icon(Icons.menu),
          ),
        Expanded(
          child: Align(
            alignment: isMediumScreenOrSmaller
                ? Alignment.centerLeft
                : Alignment.center,
            child: isMediumScreenOrSmaller
                ? const SizedBox.shrink()
                : TabBar(
                    controller: tabController,
                    isScrollable: true,
                    indicatorWeight: 5,
                    physics: const BouncingScrollPhysics(),
                    indicatorColor: accentColor,
                    tabs: Routes.values
                        .map(
                          (e) => Tab(text: e.description),
                        )
                        .toList(),
                    onTap: (index) => context
                        .read<HomeCubit>()
                        .changePage(Routes.values[index]),
                  ),
          ),
        ),
        SizedBox(width: isMediumScreenOrSmaller ? 64 : 0),
      ],
    );
  }
}
