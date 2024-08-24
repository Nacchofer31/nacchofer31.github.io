import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class ExperienceTask extends StatelessWidget {
  const ExperienceTask({
    super.key,
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          border: BorderDirectional(
            start: BorderSide(
              color: accentColor(context).withOpacity(0.6),
              width: 2,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
}
