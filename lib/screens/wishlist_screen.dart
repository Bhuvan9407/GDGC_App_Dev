import 'package:flutter/material.dart';

import '../data/destination_data.dart';
import '../models/destination.dart';
import '../state/app_state_scope.dart';
import '../widgets/empty_state.dart';
import '../widgets/remote_image.dart';

/// Wishlist screen listing every destination the traveller has saved.
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key, this.onExploreTap});

  /// Called when the traveller taps the empty state's action so the shell
  /// can switch back to the Explore tab.
  final VoidCallback? onExploreTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = AppStateScope.of(context);
    final saved = destinationsByIds(appState.savedIds);

    if (saved.isEmpty) {
      return EmptyState(
        icon: Icons.favorite_border,
        title: 'Your wishlist is empty',
        message:
            'Tap the heart on any destination to save it here and plan '
            'your next trip.',
        actionLabel: onExploreTap == null ? null : 'Start exploring',
        onAction: onExploreTap,
      );
    }

    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          Text(
            'Wishlist',
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${saved.length} ${saved.length == 1 ? 'destination' : 'destinations'} saved',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          for (final destination in saved)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: DestinationTile(
                key: ValueKey(destination.id),
                destination: destination,
              ),
            ),
        ],
      ),
    );
  }
}

/// One saved destination row with a thumbnail and a remove action.
class DestinationTile extends StatelessWidget {
  const DestinationTile({super.key, required this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = AppStateScope.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Material(
        color: theme.colorScheme.surfaceContainer,
        child: InkWell(
          onTap: () =>
              Navigator.of(context)
                  .pushNamed('/details', arguments: destination),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 72,
                    height: 72,
                    child: RemoteImage(
                      url: destination.imageUrl,
                      fallbackIcon: destination.category.icon,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Icon(
                            destination.category.icon,
                            size: 14,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              destination.location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Remove from wishlist',
                  icon: const Icon(Icons.favorite, color: Color(0xFFFF7A9C)),
                  onPressed: () => appState.removeSaved(destination.id),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
