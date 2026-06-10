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
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.check,
              size: 18,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : accentColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(minHeight: 34),
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.7,
                      fontSize: 16,
                      color: bodyTextColor(context),
                      letterSpacing: 0.2,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
