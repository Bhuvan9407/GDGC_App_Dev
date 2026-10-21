import 'package:flutter/material.dart';

/// Categories a destination can belong to.
enum DestinationCategory {
  beaches('Beaches', Icons.beach_access_outlined),
  mountains('Mountains', Icons.landscape_outlined),
  heritage('Heritage', Icons.account_balance_outlined),
  adventure('Adventure', Icons.paragliding_outlined);

  const DestinationCategory(this.label, this.icon);

  /// Human-readable label shown in the UI, e.g. "Mountains".
  final String label;

  /// Icon that visually represents the category.
  final IconData icon;

  /// Tries to resolve a category from its name (case-insensitive).
  /// Returns null when nothing matches.
  static DestinationCategory? tryParse(String value) {
    for (final category in DestinationCategory.values) {
      if (category.name == value.toLowerCase()) return category;
    }
    return null;
  }
}

/// A point of interest inside a destination, such as a temple or viewpoint.
@immutable
class Attraction {
  const Attraction({required this.name, required this.imageUrl});

  final String name;
  final String imageUrl;
}

/// A travel destination shown in the app.
@immutable
class Destination {
  const Destination({
    required this.id,
    required this.name,
    required this.location,
    required this.category,
    required this.imageUrl,
    required this.shortDescription,
    required this.description,
    required this.bestTimeToVisit,
    required this.attractions,
  });

  /// Stable identifier, also used as the wishlist key.
  final String id;
  final String name;
  final String location;
  final DestinationCategory category;

  /// Hero photograph for cards and the details screen.
  final String imageUrl;
  final String shortDescription;
  final String description;
  final String bestTimeToVisit;
  final List<Attraction> attractions;
}
