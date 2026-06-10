import 'package:nacchofer31_portfolio/portfolio.dart';

class ExperienceTask extends StatelessWidget {
  const ExperienceTask({
    super.key,
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  Color get _taskColor {
    final lowerName = name.toLowerCase();
    if (lowerName.contains('flutter')) return const Color(0xFF02569B);
    if (lowerName.contains('android')) return const Color(0xFF3DDC84);
    return accentColor;
  }

  @override
  Widget build(BuildContext context) {
    final lines = description
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    final bullets = lines
        .where((line) => line.startsWith('-'))
        .map((line) => line.substring(1).trim())
        .toList();
    final paragraphs = lines
        .where((line) => !line.startsWith('-') && !line.startsWith('»'))
        .toList();

    final techLine = lines.firstWhere(
      (line) => line.startsWith('»'),
      orElse: () => '',
    );
    final techParts = techLine.replaceFirst('»', '').split('~');
    final platform = techParts.first.trim();
    final techTags = techParts.length > 1
        ? techParts[1]
            .split(':')
            .last
            .split(',')
            .map((tag) => tag.trim())
            .where((tag) => tag.isNotEmpty)
            .toList()
        : const <String>[];

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        border: BorderDirectional(
          start: BorderSide(
            color: _taskColor.withValues(alpha: 0.6),
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
          const SizedBox(height: 12),
          ...paragraphs.map(
            (paragraph) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                paragraph,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                    ),
              ),
            ),
          ),
          ...bullets.map((bullet) => _TaskBullet(text: bullet)),
          if (platform.isNotEmpty || techTags.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (platform.isNotEmpty)
                  PortfolioTag(
                    label: platform,
                    color: _taskColor,
                    icon: Icons.code,
                  ),
                ...techTags.map(
                  (tag) => PortfolioTag(
                    label: tag,
                    color: _taskColor,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _TaskBullet extends StatelessWidget {
  const _TaskBullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: accentColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                    ),
              ),
            ),
          ],
        ),
      );
}
