import 'package:flutter/material.dart';

import '../models/destination.dart';
import '../state/app_state_scope.dart';
import '../widgets/remote_image.dart';

/// Full-page view for a single destination: hero photo, description,
/// best visiting window and its attractions.
///
/// The [Destination] is passed as route arguments; both the home grid and
/// the wishlist use the same named route `/details`.
class DestinationDetailsScreen extends StatelessWidget {
  const DestinationDetailsScreen({super.key, required this.destination});

  final Destination destination;

  static Route<Destination> route(Destination destination) {
    return MaterialPageRoute<Destination>(
      builder: (_) => DestinationDetailsScreen(destination: destination),
      settings: const RouteSettings(name: '/details'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = AppStateScope.of(context);
    final saved = appState.isSaved(destination.id);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Large hero image with collapsing title.
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            stretch: true,
            foregroundColor: Colors.white,
            title: Text(
              destination.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              // Wishlist action reachable while scrolling.
              IconButton(
                tooltip: saved ? 'Remove from wishlist' : 'Save to wishlist',
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 180),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Icon(
                    saved ? Icons.favorite : Icons.favorite_border,
                    key: ValueKey(saved),
                    color: saved ? const Color(0xFFFF7A9C) : Colors.white,
                  ),
                ),
                onPressed: () => appState.toggleSaved(destination.id),
              ),
              const SizedBox(width: 4),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'destination-image-${destination.id}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    RemoteImage(
                      url: destination.imageUrl,
                      fallbackIcon: destination.category.icon,
                    ),
                    // Top scrim so back button and heart stay visible.
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                          colors: [Color(0x99050B18), Colors.transparent],
                        ),
                      ),
                      child: SizedBox.expand(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name, category and location.
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.name,
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 16,
                                  color: Color(0xFF5B79C9),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    destination.location,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              destination.category.icon,
                              size: 16,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              destination.category.label,
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Best time to visit.
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest.withValues(
                        alpha: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Best time to visit',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                destination.bestTimeToVisit,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Overview.
                  Text(
                    'Overview',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    destination.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Attractions.
                  Text(
                    'Popular attractions',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  for (final attraction in destination.attractions)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _AttractionTile(attraction: attraction),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AttractionTile extends StatelessWidget {
  const _AttractionTile({required this.attraction});

  final Attraction attraction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Material(
        color: theme.colorScheme.surfaceContainer,
        child: Row(
          children: [
            SizedBox(
              width: 88,
              height: 80,
              child: RemoteImage(
                url: attraction.imageUrl,
                fallbackIcon: Icons.place_outlined,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  attraction.name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(
                Icons.place_outlined,
                size: 18,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
