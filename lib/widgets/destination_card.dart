import 'package:flutter/material.dart';

import '../models/destination.dart';
import '../state/app_state_scope.dart';
import 'remote_image.dart';

/// Large rounded card for a destination, used in the Home grid.
/// Tapping opens the details screen; the heart toggles the wishlist.
class DestinationCard extends StatefulWidget {
  const DestinationCard({super.key, required this.destination});

  final Destination destination;

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  bool _pressed = false;

  void _onTap() {
    setState(() => _pressed = true);
    Future.delayed(const Duration(milliseconds: 130), () {
      if (mounted) setState(() => _pressed = false);
    });
    Navigator.of(context).pushNamed('/details', arguments: widget.destination);
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final theme = Theme.of(context);
    final saved = appState.isSaved(widget.destination.id);

    return AnimatedScale(
      scale: _pressed ? 0.96 : 1,
      duration: const Duration(milliseconds: 130),
      curve: Curves.easeOut,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Material(
          color: theme.colorScheme.surfaceContainer,
          child: InkWell(
            onTap: _onTap,
            child: SizedBox.expand(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'destination-image-${widget.destination.id}',
                    child: RemoteImage(
                      url: widget.destination.imageUrl,
                      fallbackIcon: widget.destination.category.icon,
                    ),
                  ),
                  // Bottom scrim so the text stays readable.
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.45, 1],
                        colors: [Colors.transparent, Color(0xCC050B18)],
                      ),
                    ),
                    child: SizedBox.expand(),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: _WishlistHeartButton(
                      destination: widget.destination,
                      filled: saved,
                    ),
                  ),
                  Positioned(
                    left: 14,
                    right: 14,
                    bottom: 14,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.16),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            widget.destination.category.label,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.destination.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: Color(0xFFA9C2F0),
                            ),
                            const SizedBox(width: 3),
                            Expanded(
                              child: Text(
                                widget.destination.location,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFFC6D6F5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Heart button used on both cards (column layout) and details screens.
class _WishlistHeartButton extends StatelessWidget {
  const _WishlistHeartButton({required this.destination, required this.filled});

  final Destination destination;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    return Material(
      color: Colors.white.withValues(alpha: 0.14),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => appState.toggleSaved(destination.id),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Icon(
              filled ? Icons.favorite : Icons.favorite_border,
              key: ValueKey(filled),
              size: 20,
              color: filled ? const Color(0xFFFF7A9C) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
