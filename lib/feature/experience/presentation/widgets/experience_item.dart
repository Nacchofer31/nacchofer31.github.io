import 'package:nacchofer31_portfolio/portfolio.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({
    super.key,
    required this.experienceData,
  });

  final ExperienceModel experienceData;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final locationParts = experienceData.location
        .split('|')
        .map((part) => part.trim())
        .where((part) => part.isNotEmpty)
        .toList();

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
                    experienceData.icon,
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
                      experienceData.clientName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      experienceData.description,
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
                label: experienceData.date,
                icon: Icons.calendar_today_outlined,
              ),
              ...locationParts.map(
                (part) => PortfolioTag(
                  label: part,
                  icon: part == locationParts.first
                      ? Icons.place_outlined
                      : Icons.business_center_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: experienceData.tasks
                .map((task) => ExperienceTask(
                      name: task.name,
                      description: task.description,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
