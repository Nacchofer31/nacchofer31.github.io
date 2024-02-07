import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/base/provider.dart';

class Tab extends StatefulWidget {
  const Tab({super.key, this.child});

  final int index = 0;
  final Widget? child;

  @override
  State<Tab> createState() => _TabState();
}

class _TabState extends State<Tab> with SingleTickerProviderStateMixin {
  late TabController tabController;

  int get routeIndex {
    return widget.index.clamp(0, 3);
  }

  int selectedMenu = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabController =
        TabController(length: 4, vsync: this, initialIndex: routeIndex);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
