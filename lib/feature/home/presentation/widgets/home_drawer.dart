import 'package:nacchofer31_portfolio/portfolio.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedRoute = context.select<HomeCubit, Routes>(
      (cubit) => cubit.state.selectedPage,
    );

    return Drawer(
      backgroundColor: cardBackground(context),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: Routes.values.map((route) {
                        final isSelected = selectedRoute == route;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: ListTile(
                            leading: Icon(
                              route.icon,
                              color: isSelected ? Colors.white : null,
                            ),
                            title: Text(
                              route.description,
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isSelected ? Colors.white : null,
                              ),
                            ),
                            selected: isSelected,
                            selectedTileColor: accentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () {
                              context.read<HomeCubit>().changePage(route);
                              Navigator.pop(context);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const FooterView(),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
