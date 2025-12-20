import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollAppearanceTransition extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final Offset beginOffset;

  const ScrollAppearanceTransition({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.delay = Duration.zero,
    this.curve = Curves.easeOutCubic,
    // Top to bottom by default
    this.beginOffset = const Offset(0.0, -0.1),
  });

  @override
  State<ScrollAppearanceTransition> createState() =>
      _ScrollAppearanceTransitionState();
}

class _ScrollAppearanceTransitionState extends State<ScrollAppearanceTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _opacity;

  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _slide = Tween<Offset>(
      begin: widget.beginOffset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (_hasStarted) return;

    if (info.visibleFraction > 0.1) {
      _start();
    }
  }

  Future<void> _start() async {
    _hasStarted = true;
    await Future.delayed(widget.delay);

    if (!mounted) return;

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('visibility_${identityHashCode(widget.child)}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _opacity,
        child: SlideTransition(
          position: _slide,
          child: widget.child,
        ),
      ),
    );
  }
}
