import 'package:coffee_shop/components/my_drawer.dart';
import 'package:coffee_shop/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MySliverAppbar extends ConsumerWidget {
  const MySliverAppbar({
    super.key,
    required this.child,
    required this.title,
  });

  final Widget child;
  final Widget title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    // Accessing the themeNotifier provider to toggle the theme
    final themeNotifier = ref.watch(themeProvider.notifier);

    return SliverAppBar(
      expandedHeight: screenSize.height / 3,
      collapsedHeight: screenSize.height / 10,
      floating: false,
      pinned: true,
      actions: [
        // Toggle theme button
        IconButton(
          onPressed: () {
            // Toggling the theme
            themeNotifier.toggleTheme();
          },
          icon: const Icon(Icons.brightness_6),
        ),
      ],
      backgroundColor: theme.colorScheme.surface,
      title: const MyDrawer(),
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        background: child,
      ),
    );
  }
}
