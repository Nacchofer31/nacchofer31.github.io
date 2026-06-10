import 'dart:ui';

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

    return SelectionContainer.disabled(
      child: Row(
        children: [
          if (isMediumScreenOrSmaller) ...[
            IconButton(
              onPressed: onMenuPressed,
              icon: Icon(
                Icons.menu,
                color: brandDomainColor(context),
              ),
            ),
            SizedBox(width: Responsive.maxSmallSpacing(context)),
            const Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: BrandLogo(),
                ),
              ),
            ),
          ] else ...[
            const BrandLogo(),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: _FadingTabBar(tabController: tabController),
              ),
            ),
          ],
          SizedBox(width: Responsive.maxSmallSpacing(context)),
          const _ThemeToggleButton(),
        ],
      ),
    );
  }
}

class _FadingTabBar extends StatefulWidget {
  const _FadingTabBar({required this.tabController});

  final TabController tabController;

  @override
  State<_FadingTabBar> createState() => _FadingTabBarState();
}

class _FadingTabBarState extends State<_FadingTabBar> {
  bool _canScrollStart = false;
  bool _canScrollEnd = false;

  void _updateFades(ScrollMetrics metrics) {
    if (metrics.axis != Axis.horizontal) return;
    final canScrollStart = metrics.extentBefore > 1;
    final canScrollEnd = metrics.extentAfter > 1;
    if (canScrollStart != _canScrollStart || canScrollEnd != _canScrollEnd) {
      setState(() {
        _canScrollStart = canScrollStart;
        _canScrollEnd = canScrollEnd;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollMetricsNotification>(
      onNotification: (notification) {
        _updateFades(notification.metrics);
        return false;
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          _updateFades(notification.metrics);
          return false;
        },
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              _canScrollStart ? Colors.transparent : Colors.white,
              Colors.white,
              Colors.white,
              _canScrollEnd ? Colors.transparent : Colors.white,
            ],
            stops: const [0.0, 0.1, 0.9, 1.0],
          ).createShader(bounds),
          blendMode: BlendMode.dstIn,
          child: ScrollConfiguration(
            behavior: const MaterialScrollBehavior().copyWith(
              dragDevices: PointerDeviceKind.values.toSet(),
              scrollbars: false,
            ),
            child: TabBar(
              controller: widget.tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerHeight: 0,
              indicatorWeight: 5,
              labelColor: brandDomainColor(context),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              physics: const BouncingScrollPhysics(),
              indicatorColor: brandDomainColor(context),
              tabs: Routes.values
                  .map(
                    (e) => Tab(text: e.description),
                  )
                  .toList(),
              onTap: (index) =>
                  context.read<HomeCubit>().changePage(Routes.values[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeToggleButton extends StatelessWidget {
  const _ThemeToggleButton();

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    return IconButton(
      onPressed: () => themeController.toogle(),
      tooltip: themeController.isDarkMode ? 'Light mode' : 'Dark mode',
      icon: Icon(
        themeController.isDarkMode ? Icons.dark_mode : Icons.light_mode,
        color: brandDomainColor(context),
      ),
    );
  }
}
