import 'package:nacchofer31_portfolio/portfolio.dart';

class EducationItem extends StatelessWidget {
  const EducationItem({super.key, required this.educationData});

  final EducationModel educationData;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color(0xff252526)
            : const Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: cardBorderColor(context),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 56,
                height: 56,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    educationData.icon,
                    width: 56,
                    height: 56,
                  ),
                ),
              ),
              SizedBox(width: Responsive.maxSmallSpacing(context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      educationData.collegeName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      educationData.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: bodyTextColor(context),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              PortfolioTag(
                label: educationData.date,
                icon: Icons.calendar_today_outlined,
              ),
              if (educationData.location.isNotEmpty)
                PortfolioTag(
                  label: educationData.location,
                  icon: Icons.place_outlined,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
