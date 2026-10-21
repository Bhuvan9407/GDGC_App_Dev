import 'package:flutter/material.dart';

import 'models/destination.dart';
import 'screens/destination_details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/wishlist_screen.dart';
import 'state/app_state.dart';
import 'state/app_state_scope.dart';

void main() {
  runApp(const TravelExplorerApp());
}

/// Palette anchors shared by the light and dark themes.
const Color _seedColor = Color(0xFF3B5FD9);

class TravelExplorerApp extends StatelessWidget {
  const TravelExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    );
    final darkScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    );

    return AppStateScope(
      notifier: AppState(),
      child: MaterialApp(
        title: 'Travel Explorer',
        debugShowCheckedModeBanner: false,
        theme: _buildTheme(lightScheme),
        darkTheme: _buildTheme(darkScheme),
        themeMode: ThemeMode.system,
        home: const MainShell(),
        onGenerateRoute: (settings) {
          if (settings.name == '/details') {
            final destination = settings.arguments;
            if (destination is Destination) {
              return DestinationDetailsScreen.route(destination);
            }
          }
          return null;
        },
      ),
    );
  }

  ThemeData _buildTheme(ColorScheme scheme) {
    final isDark = scheme.brightness == Brightness.dark;
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: isDark
          ? const Color(0xFF0B1220)
          : const Color(0xFFF6F8FE),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: scheme.onSurface,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: isDark ? const Color(0xFF131C31) : scheme.surface,
        indicatorColor: scheme.primaryContainer,
        height: 68,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: scheme.onSurfaceVariant.withValues(alpha: 0.7),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}

/// Bottom navigation shell holding the Explore and Wishlist tabs.
/// [IndexedStack] keeps each tab's state (search text and scrolls) alive.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final wishlistCount = appState.savedIds.length;

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(onOpenWishlist: () => setState(() => _selectedIndex = 1)),
          WishlistScreen(
            onExploreTap: () => setState(() => _selectedIndex = 0),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: wishlistCount > 0,
              label: Text('$wishlistCount'),
              child: const Icon(Icons.favorite_border),
            ),
            selectedIcon: Badge(
              isLabelVisible: wishlistCount > 0,
              label: Text('$wishlistCount'),
              child: const Icon(Icons.favorite),
            ),
            label: 'Wishlist',
          ),
        ],
      ),
    );
  }
}
