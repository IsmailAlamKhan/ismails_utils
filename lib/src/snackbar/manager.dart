import 'package:flutter/material.dart';
import '../src.dart';

/// Snackbar manager for the [IsmailSnackbar]
class SnackbarManager {
  SnackbarManager._();

  static final List<OverlayEntry> _entries = [];

  /// List of the snackbar entries
  static List<OverlayEntry> get entries => _entries;

  /// dismiss all snackbars
  static void dismissAll() {
    for (final entry in entries) {
      entry.remove();
    }
    entries.clear();
  }

  /// dismiss one snackbar
  static void dismiss(OverlayEntry entry) {
    entry.remove();
    if (entries.contains(entry)) entries.remove(entry);
  }

  /// insert one snackbar
  static void insert(OverlayEntry entry) {
    dismissAll();
    if (!entries.contains(entry)) entries.add(entry);
  }
}
