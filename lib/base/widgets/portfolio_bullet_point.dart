import 'package:nacchofer31_portfolio/portfolio.dart';

class PortfolioBulletPoint extends StatelessWidget {
  const PortfolioBulletPoint({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 20,
            color: accentColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: bodyTextColor(context).withValues(alpha: 0.8),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
