import 'package:flutter/material.dart';

class SnackbarManager {
  SnackbarManager._();

  static final List<OverlayEntry> _entries = [];
  static List<OverlayEntry> get entries => _entries;

  static void dismissAll() {
    for (final entry in entries) {
      entry.remove();
    }
    entries.clear();
  }

  static void dismiss(OverlayEntry entry) {
    entry.remove();
    if (entries.contains(entry)) entries.remove(entry);
  }

  static void insert(OverlayEntry entry) {
    dismissAll();
    if (!entries.contains(entry)) entries.add(entry);
  }
}
