import 'package:flutter/material.dart';

class Responsive {
  @protected
  static Size getSize(BuildContext context) => MediaQuery.of(context).size;

  static double maxContainerWidth(BuildContext context, double width) =>
      MediaQuery.of(context).size.width >= width ? width : double.infinity;

  static double maxMainSpacing(BuildContext context) =>
      widthIsSmallerThan(context, 680) ? 12 : 24;

  static double maxLargeSpacing(BuildContext context) =>
      maxMainSpacing(context) * 1.333;

  static double maxSmallSpacing(BuildContext context) =>
      maxMainSpacing(context) * 0.75;

  static double maxSquareSize(BuildContext context) =>
      widthIsSmallerThan(context, 680) ? 72 : 128;

  static bool widthIsHigherThan(BuildContext context, double width) =>
      MediaQuery.of(context).size.width >= width;

  static bool widthIsSmallerThan(BuildContext context, double width) =>
      MediaQuery.of(context).size.width <= width;

  static TextStyle? mainHeadline(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return widthIsSmallerThan(context, 680)
        ? theme.headlineMedium
        : theme.headlineLarge;
  }

  static TextStyle? subHeadline(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final style = theme.headlineMedium!.copyWith(
      color: theme.bodySmall!.color,
    );
    return widthIsSmallerThan(context, 540)
        ? style.copyWith(
            fontSize: 14,
          )
        : style;
  }

  static bool isMediumScreenOrSmaller(BuildContext context) =>
      getSize(context).width <= 580;

  static bool isVerySmall(BuildContext context) =>
      getSize(context).width <= 400;

  static bool isExtremelySmall(BuildContext context) =>
      getSize(context).width <= 340;
}
