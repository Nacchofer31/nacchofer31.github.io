import 'package:nacchofer31_portfolio/portfolio.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final profileModel = context.select<HomeCubit, ProfileModel>(
      (cubit) => cubit.state.homeModel.profileModel,
    );
    final isExtremelySmall = Responsive.isExtremelySmall(context);

    final roleParts = profileModel.role
        .split('|')
        .map((part) => part.trim())
        .where((part) => part.isNotEmpty)
        .toList();
    final mainRole = roleParts.isEmpty ? '' : roleParts.first;
    final roleTags =
        roleParts.length > 1 ? roleParts.sublist(1) : const <String>[];

    return AnimatedContainer(
      width: double.infinity,
      duration: const Duration(milliseconds: 350),
      padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: isExtremelySmall
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          if (!isExtremelySmall) ...[
            _ProfileAvatar(avatarPath: profileModel.avatarPath),
            SizedBox(width: Responsive.maxMainSpacing(context)),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  profileModel.fullName,
                  style: Responsive.mainHeadline(context),
                ),
                SizedBox(height: Responsive.maxSmallSpacing(context) / 2),
                Text(
                  mainRole,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: bodyTextColor(context),
                      ),
                ),
                if (roleTags.isNotEmpty) ...[
                  SizedBox(height: Responsive.maxSmallSpacing(context)),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        roleTags.map((tag) => _RoleTag(label: tag)).toList(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.avatarPath});

  final String avatarPath;

  @override
  Widget build(BuildContext context) {
    final size = Responsive.maxSquareSize(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor,
            accentColor.withValues(alpha: 0.3),
          ],
        ),
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: cardBackground(context),
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: Image.asset(
              avatarPath,
              width: size,
              height: size,
            ).image,
          ),
        ),
      ),
    );
  }
}

class _RoleTag extends StatelessWidget {
  const _RoleTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: accentColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: accentColor.withValues(alpha: 0.5),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: bodyTextColor(context),
              ),
        ),
      );
}
