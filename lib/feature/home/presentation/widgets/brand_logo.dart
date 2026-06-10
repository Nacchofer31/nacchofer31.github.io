import 'package:nacchofer31_portfolio/portfolio.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        );
    final domainColor = brandDomainColor(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.read<HomeCubit>().changePage(Routes.about),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'nacchofer',
                style: baseStyle,
              ),
              TextSpan(
                text: '.dev',
                style: baseStyle?.copyWith(
                  color: domainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
