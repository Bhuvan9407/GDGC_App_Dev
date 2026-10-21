import 'package:flutter/material.dart';

import '../state/app_state.dart';

/// Provides one [AppState] instance to the whole widget tree.
///
/// Anchored on [InheritedNotifier], so any descendant can rebuild
/// automatically when the state changes with `AppStateScope.of(context)`.
class AppStateScope extends InheritedNotifier<AppState> {
  const AppStateScope({
    super.key,
    required AppState super.notifier,
    required super.child,
  });

  /// Returns the ambient [AppState] and registers this widget as a listener.
  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    assert(scope != null, 'No AppStateScope found in the widget tree.');
    return scope!.notifier!;
  }
}
