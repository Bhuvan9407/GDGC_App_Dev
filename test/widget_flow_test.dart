import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_explorer/main.dart';
import 'package:travel_explorer/widgets/destination_card.dart';

void main() {
  testWidgets('search filters cards and clearing restores every destination', (
    tester,
  ) async {
    await tester.pumpWidget(const TravelExplorerApp());
    await tester.pump();

    expect(find.byType(DestinationCard), findsNWidgets(8));

    await tester.enterText(find.byType(TextField), 'goa');
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(DestinationCard), findsOneWidget);
    expect(find.text('No destinations found'), findsNothing);

    // Tapping the clear button must restore the full grid.
    await tester.tap(find.byTooltip('Clear search'));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(DestinationCard), findsNWidgets(8));
    expect(find.text('Search destinations'), findsOneWidget);
  });

  testWidgets('saving on Explore shows up in the Wishlist tab', (tester) async {
    await tester.pumpWidget(const TravelExplorerApp());
    await tester.pump();

    // Save Goa from its card.
    final goaCard = find.ancestor(
      of: find.text('Goa'),
      matching: find.byType(DestinationCard),
    );
    await tester.tap(
      find.descendant(
        of: goaCard,
        matching: find.byIcon(Icons.favorite_border),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));

    // Open the Wishlist tab.
    await tester.tap(find.text('Wishlist'));
    await tester.pump(const Duration(milliseconds: 600));

    expect(find.text('1 destination saved'), findsOneWidget);
    expect(find.text('Goa'), findsOneWidget);
  });

  testWidgets('no-results empty state appears for unmatched search', (
    tester,
  ) async {
    await tester.pumpWidget(const TravelExplorerApp());
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'zzz');
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('No destinations found'), findsOneWidget);
    expect(find.byType(DestinationCard), findsNothing);
  });

  testWidgets('header shortcut opens the Wishlist tab', (tester) async {
    await tester.pumpWidget(const TravelExplorerApp());
    await tester.pump();

    await tester.tap(find.byTooltip('Open wishlist'));
    await tester.pump(const Duration(milliseconds: 600));

    expect(find.text('Your wishlist is empty'), findsOneWidget);
  });
}
