import 'package:nacchofer31_portfolio/portfolio.dart';

class ContactBulletSection extends StatelessWidget {
  const ContactBulletSection({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'I am currently open to new professional proposals and collaborative opportunities. You may contact me regarding:',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: bodyTextColor(context),
                ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          const PortfolioBulletPoint(
              text:
                  'Native Android software development projects and opportunities'),
          const PortfolioBulletPoint(
              text:
                  'Hybrid Flutter software development projects and opportunities'),
          const PortfolioBulletPoint(
              text: 'DevOps & GenAI projects and opportunities'),
          const PortfolioBulletPoint(
              text: 'Collaborative research, open source projects and innovation'),
        ],
      );
}
