import 'package:flutter/foundation.dart';

/// Holds app-wide state that multiple screens need, currently the wishlist.
///
/// It extends [ChangeNotifier] so any widget can listen with
/// [ListenableBuilder] (or through [AppStateScope]) and rebuild whenever a
/// destination is saved or removed. The state lives above the navigation
/// shell in the widget tree, so Home, Details and Wishlist all read and
/// modify the exact same in-memory data.
class AppState extends ChangeNotifier {
  final Set<String> _savedIds = {};

  /// IDs of destinations currently saved to the wishlist.
  Set<String> get savedIds => Set.unmodifiable(_savedIds);

  /// True when [id] is on the wishlist.
  bool isSaved(String id) => _savedIds.contains(id);

  /// Adds or removes the destination with the given [id].
  /// Returns true when the destination is saved after the call.
  bool toggleSaved(String id) {
    if (_savedIds.contains(id)) {
      _savedIds.remove(id);
    } else {
      _savedIds.add(id);
    }
    notifyListeners();
    return _savedIds.contains(id);
  }

  /// Removes the destination with the given [id], if present.
  void removeSaved(String id) {
    if (_savedIds.remove(id)) notifyListeners();
  }

  /// Empties the wishlist.
  void clearSaved() {
    if (_savedIds.isEmpty) return;
    _savedIds.clear();
    notifyListeners();
  }
}
