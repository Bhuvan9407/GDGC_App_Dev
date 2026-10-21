import 'package:flutter_test/flutter_test.dart';
import 'package:travel_explorer/data/destination_data.dart';
import 'package:travel_explorer/models/destination.dart';
import 'package:travel_explorer/state/app_state.dart';

void main() {
  group('destination data', () {
    test('ships at least eight destinations across every category', () {
      expect(destinations.length, greaterThanOrEqualTo(8));
      for (final category in DestinationCategory.values) {
        final inCategory = destinations
            .where((destination) => destination.category == category)
            .toList();
        expect(inCategory, isNotEmpty, reason: '${category.label} is empty');
      }
    });

    test('every destination has at least two attractions with images', () {
      for (final destination in destinations) {
        expect(
          destination.attractions.length,
          greaterThanOrEqualTo(2),
          reason: '${destination.name} has too few attractions',
        );
        for (final attraction in destination.attractions) {
          expect(attraction.name, isNotEmpty);
          expect(attraction.imageUrl, startsWith('https://'));
        }
      }
    });

    test('destination ids and images are unique', () {
      final ids = destinations.map((destination) => destination.id).toSet();
      final images = destinations
          .map((destination) => destination.imageUrl)
          .toSet();
      expect(ids.length, destinations.length);
      expect(images.length, destinations.length);
    });
  });

  group('filterDestinations', () {
    test('returns everything when no query or category is given', () {
      expect(filterDestinations(destinations).length, destinations.length);
    });

    test('searches by name case-insensitively', () {
      final results = filterDestinations(destinations, query: 'gOa');
      expect(results, hasLength(1));
      expect(results.first.name, 'Goa');

      expect(filterDestinations(destinations, query: 'SPITI'), hasLength(1));

      // Leading/trailing whitespace must not break matching.
      expect(
        filterDestinations(destinations, query: '  jaipur  ').first.name,
        'Jaipur',
      );
    });

    test('returns no matches for unknown names', () {
      expect(filterDestinations(destinations, query: 'atlantis'), isEmpty);
    });

    test('filters by category', () {
      final mountains = filterDestinations(
        destinations,
        category: DestinationCategory.mountains,
      );
      expect(
        mountains,
        everyElement(
          isA<Destination>().having(
            (d) => d.category,
            'category',
            DestinationCategory.mountains,
          ),
        ),
      );
      expect(mountains.length, greaterThanOrEqualTo(2));
    });

    test('combines search text and category', () {
      final results = filterDestinations(
        destinations,
        query: 'goa',
        category: DestinationCategory.heritage,
      );
      expect(results, isEmpty);

      final goa = filterDestinations(
        destinations,
        query: 'goa',
        category: DestinationCategory.beaches,
      );
      expect(goa.map((destination) => destination.name), ['Goa']);
    });
  });

  group('destinationsByIds', () {
    test('skips unknown ids and keeps known ones', () {
      final result = destinationsByIds(['goa', 'not-real', 'hampi']);
      expect(result.map((destination) => destination.id), ['goa', 'hampi']);
    });
  });

  group('AppState (wishlist)', () {
    test('starts empty', () {
      expect(AppState().savedIds, isEmpty);
    });

    test('toggleSaved adds once and never duplicates', () {
      final state = AppState();
      expect(state.isSaved('goa'), isFalse);

      expect(state.toggleSaved('goa'), isTrue);
      expect(state.isSaved('goa'), isTrue);
      expect(state.savedIds, ['goa']);

      // Saving the same destination again should still keep one entry —
      // the heart on another screen toggles it off instead of duplicating.
      expect(state.toggleSaved('goa'), isFalse);
      expect(state.savedIds, isEmpty);
    });

    test('supports several destinations at once', () {
      final state = AppState();
      state.toggleSaved('goa');
      state.toggleSaved('hampi');
      state.toggleSaved('spiti-valley');
      expect(state.savedIds.length, 3);
    });

    test('removeSaved only removes known ids', () {
      final state = AppState();
      state.toggleSaved('goa');
      state.removeSaved('hampi'); // not on the wishlist
      state.removeSaved('goa');
      expect(state.savedIds, isEmpty);
      expect(state.isSaved('goa'), isFalse);
    });

    test('notifies listeners on every change', () {
      final state = AppState();
      var notifications = 0;
      state.addListener(() => notifications++);
      state.toggleSaved('goa');
      state.removeSaved('goa');
      state.clearSaved(); // already empty, no notification
      expect(notifications, 2);
    });
  });
}
