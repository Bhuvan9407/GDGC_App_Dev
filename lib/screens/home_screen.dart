import 'package:flutter/material.dart';

import '../data/destination_data.dart';
import '../models/destination.dart';
import '../state/app_state_scope.dart';
import '../widgets/category_filter_bar.dart';
import '../widgets/destination_card.dart';
import '../widgets/empty_state.dart';

/// Destination discovery screen: search, category filters and the
/// destination card grid.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onOpenWishlist});

  /// Switches the shell to the Wishlist tab. Used by the saved-count
  /// shortcut in the header.
  final VoidCallback onOpenWishlist;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  DestinationCategory? _selectedCategory;

  /// Applies search text and the selected category to the full destination
  /// list. Both work together.
  List<Destination> _filteredDestinations() {
    return filterDestinations(
      destinations,
      query: _searchController.text,
      category: _selectedCategory,
    );
  }

  void _clearSearch() {
    _searchController.clear();
    _searchFocus.unfocus();
    // The grid is derived from the controller inside build, so rebuild
    // explicitly after clearing the text.
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = AppStateScope.of(context);
    final wishlistCount = appState.savedIds.length;

    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          // Welcome header.
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Where will today take you?',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Tooltip(
                    message: 'Open wishlist',
                    child: Material(
                      color: theme.colorScheme.primaryContainer,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: widget.onOpenWishlist,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            Icons.travel_explore,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (wishlistCount > 0)
                    Positioned(
                      top: -2,
                      right: -2,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$wishlistCount',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Search field.
          TextField(
            controller: _searchController,
            focusNode: _searchFocus,
            textInputAction: TextInputAction.search,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Search destinations',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isEmpty
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.close),
                      tooltip: 'Clear search',
                      onPressed: _clearSearch,
                    ),
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.6,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Category filters.
          CategoryFilterBar(
            selected: _selectedCategory,
            onSelected: (category) =>
                setState(() => _selectedCategory = category),
          ),
          const SizedBox(height: 20),

          // Results grid.
          Builder(
            builder: (context) {
              final results = _filteredDestinations();
              if (results.isEmpty) {
                return const _NoResultsView();
              }
              return GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.72,
                children: [
                  for (final destination in results)
                    DestinationCard(destination: destination),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Shown when no destination matches the current search and filters.
class _NoResultsView extends StatelessWidget {
  const _NoResultsView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: EmptyState(
        icon: Icons.search_off,
        title: 'No destinations found',
        message:
            'Try a different name or switch categories — there is plenty more '
            'to explore.',
      ),
    );
  }
}
