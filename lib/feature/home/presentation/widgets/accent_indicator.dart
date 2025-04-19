import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class AccentWidget extends StatelessWidget {
  const AccentWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 6,
        width: 48,
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(5),
        ),
      );
}
