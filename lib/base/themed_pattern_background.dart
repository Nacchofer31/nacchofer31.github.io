import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nacchofer31_portfolio/base/provider.dart';
import 'package:nacchofer31_portfolio/controllers/theme_controller.dart';

class ThemedPatternBackground extends StatefulWidget {
  final Widget? child;
  final double iconSize;
  final double iconSpacing;
  final double opacity;
  final Duration animationDuration;
  final List<String> skillAssets;

  const ThemedPatternBackground({
    super.key,
    required this.skillAssets,
    this.child,
    this.iconSize = 35,
    this.iconSpacing = 100,
    this.opacity = .15,
    this.animationDuration = const Duration(seconds: 30),
  });

  @override
  State<ThemedPatternBackground> createState() =>
      _ThemedPatternBackgroundState();
}

class _ThemedPatternBackgroundState extends State<ThemedPatternBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    final isDarkMode = themeController.isDarkMode;
    if (widget.skillAssets.isEmpty) return const SizedBox.shrink();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            RepaintBoundary(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return _buildPatternLayer(
                    constraints,
                    isDarkMode,
                    _animation.value,
                  );
                },
              ),
            ),
            if (widget.child != null) widget.child!,
          ],
        );
      },
    );
  }

  Widget _buildPatternLayer(
    BoxConstraints constraints,
    bool isDarkMode,
    double animationProgress,
  ) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;

    final offsetX =
        (animationProgress * widget.iconSpacing) % widget.iconSpacing;
    final offsetY =
        (animationProgress * widget.iconSpacing) % widget.iconSpacing;

    final columnsCount = (width / widget.iconSpacing).ceil() + 2;
    final rowsCount = (height / widget.iconSpacing).ceil() + 2;

    final iconColor = isDarkMode
        ? Colors.white.withValues(alpha: widget.opacity)
        : Colors.black.withValues(alpha: widget.opacity);

    final List<Widget> icons = [];

    for (int row = -1; row < rowsCount; row++) {
      for (int col = -1; col < columnsCount; col++) {
        final stableIndex =
            ((row % 10) + 10) % 10 * 10 + ((col % 10) + 10) % 10;

        final svgSeed = (row * 7 + col * 13) % 100;
        final svgIndex = svgSeed % widget.skillAssets.length;
        final svgPath = widget.skillAssets[svgIndex];

        final posX = col * widget.iconSpacing - offsetX;
        final posY = row * widget.iconSpacing - offsetY;

        final random = math.Random(stableIndex);
        final offsetXRandom = random.nextDouble() * 30 - 15;
        final offsetYRandom = random.nextDouble() * 30 - 15;
        final rotation = random.nextDouble() * 0.4 - 0.2;

        icons.add(
          Positioned(
            left: posX + offsetXRandom,
            top: posY + offsetYRandom,
            child: Transform.rotate(
              angle: rotation,
              child: SvgPicture.asset(
                svgPath,
                width: widget.iconSize,
                height: widget.iconSize,
                colorFilter: ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        );
      }
    }

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: icons,
      ),
    );
  }
}
