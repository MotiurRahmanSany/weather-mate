import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_mate/providers/screen_provider.dart';

class CustomNavigation extends ConsumerWidget {
  const CustomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentScreenIndex = ref.watch(screenIndexProvider);
    return GNav(
      selectedIndex: currentScreenIndex,
      gap: 8,
      tabBorderRadius: 100,
      padding: const EdgeInsets.all(10),
      duration: const Duration(milliseconds: 400),
      tabMargin: const EdgeInsets.all(8),
      backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.5),
      tabBackgroundColor: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.9),
      onTabChange: (index) =>
          ref.read(screenIndexProvider.notifier).state = index,
      tabs: [
        GButton(
          icon: Icons.home_filled,
          text: 'Home',
          iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
          textColor: Theme.of(context).colorScheme.onSurfaceVariant,
          iconSize: 24,
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        GButton(
          icon: Icons.search,
          text: 'Search',
          iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
          textColor: Theme.of(context).colorScheme.onSurfaceVariant,
          iconSize: 24,
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        GButton(
          icon: Icons.favorite_outline,
          text: 'Favorites',
          iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
          textColor: Theme.of(context).colorScheme.onSurfaceVariant,
          iconSize: 24,
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        GButton(
          icon: Icons.menu,
          text: 'Preferences',
          iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
          textColor: Theme.of(context).colorScheme.onSurfaceVariant,
          iconSize: 24,
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      ],
    );
  }
}
