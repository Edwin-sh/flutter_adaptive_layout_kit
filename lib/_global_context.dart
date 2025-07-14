import 'package:flutter/widgets.dart';

class GlobalContext {
  static BuildContext? _context;

  static BuildContext get context {
    if (_context == null) {
      throw StateError(
        'Context not initialized. Make sure ResponsiveScreenInitializer is used.',
      );
    }
    return _context!;
  }

  static void setContext(BuildContext context) {
    _context = context;
  }

  static bool get isInitialized => _context != null;

  static void dispose() {
    _context = null;
  }
}
