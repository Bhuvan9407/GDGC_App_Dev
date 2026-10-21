import 'package:flutter/material.dart';

import '../models/destination.dart';

/// Horizontally scrollable "All / Beaches / Mountains / ..." selector.
class CategoryFilterBar extends StatelessWidget {
  const CategoryFilterBar({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  /// Currently selected category, or null for "All".
  final DestinationCategory? selected;
  final ValueChanged<DestinationCategory?> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children:
            [
                  _Chip(
                    label: 'All',
                    icon: Icons.explore_outlined,
                    selected: selected == null,
                    onTap: () => onSelected(null),
                  ),
                  for (final category in DestinationCategory.values)
                    _Chip(
                      label: category.label,
                      icon: category.icon,
                      selected: selected == category,
                      onTap: () => onSelected(category),
                    ),
                ]
                .map(
                  (child) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: child,
                  ),
                )
                .toList(),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Material(
      color: selected
          ? colors.primary
          : colors.surfaceContainerHighest.withValues(alpha: 0.85),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
                color: selected ? colors.onPrimary : colors.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: selected ? colors.onPrimary : colors.onSurface,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
