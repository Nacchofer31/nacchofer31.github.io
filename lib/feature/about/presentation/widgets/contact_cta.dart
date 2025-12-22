import 'package:nacchofer31_portfolio/portfolio.dart';

class ContactCTA extends StatelessWidget {
  const ContactCTA({super.key});

  @protected
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: cardBorderColor(context),
          width: 1,
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Get in touch',
              style: Responsive.mainHeadline(context),
            ),
            SizedBox(height: Responsive.maxSmallSpacing(context)),
            const AccentWidget(),
            SizedBox(height: Responsive.maxSmallSpacing(context)),
            const ContactBulletSection(),
            const SizedBox(height: 32),
            FilledButton.icon(
              iconAlignment: IconAlignment.end,
              onPressed: () =>
                  context.read<HomeCubit>().changePage(Routes.contact),
              style: FilledButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
              ),
              icon: const Icon(Icons.arrow_forward, size: 20),
              label: const Text(
                'Contact me',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
