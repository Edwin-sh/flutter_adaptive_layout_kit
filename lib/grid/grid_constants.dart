// Grid constants and responsive design values
import 'package:flutter/material.dart';

import '../_global_context.dart';

/// A class that contains all responsive design constants and utilities.
///
/// This class centralizes all grid-related constants including margins, gutters,
/// spacing values, and maximum widget widths for different screen types.
class GridConstants {
  // Private constructor to prevent instantiation
  GridConstants._();

  // Breakpoint definitions
  static const double tabletBreakpoint = 1024;

  // Screen-specific margin values
  static const double mobileMargin = 16;
  static const double tabletMargin = 32;
  static const double desktopMargin = 60;

  // Screen-specific gutter values (spacing between grid items)
  static const double mobileGutter = 16;
  static const double tabletGutter = 20;
  static const double desktopGutter = 30;

  // Maximum width for widgets on different screen types
  /// The maximum width for widgets on mobile, the default value is set to double.infinity
  static const double mobileWidgetMaxWidth =
      double.infinity; // Widgets can expand to full width on mobile

  /// The maximum width for widgets on desktop, the default value is set to 645.
  static const double desktopWidgetMaxWidth =
      645; // Max width for widgets on desktop

  /// Gets the maximum width for widgets on tablet screens.
  ///
  /// If the device width is greater than the tablet breakpoint (1024),
  /// it uses [desktopWidgetMaxWidth], otherwise it uses [double.infinity].
  static double getTabletWidgetMaxWidth() {
    final screenWidth = MediaQuery.of(GlobalContext.context).size.width;
    return screenWidth > tabletBreakpoint
        ? desktopWidgetMaxWidth
        : double.infinity;
  }

  // Responsive spacing/sizing constants (XS - Extra Small)
  static const double mobileXS = 4;
  static const double tabletXS = 6;
  static const double desktopXS = 8;

  // Responsive spacing/sizing constants (S - Small)
  static const double mobileS = 8;
  static const double tabletS = 12;
  static const double desktopS = 16;

  // Responsive spacing/sizing constants (M - Medium)
  static const double mobileM = 12;
  static const double tabletM = 16;
  static const double desktopM = 24;

  // Responsive spacing/sizing constants (L - Large)
  static const double mobileL = 16;
  static const double tabletL = 24;
  static const double desktopL = 32;

  // Responsive spacing/sizing constants (XL - Extra Large)
  static const double mobileXL = 24;
  static const double tabletXL = 32;
  static const double desktopXL = 48;

  // Responsive spacing/sizing constants (XXL - Extra Extra Large)
  static const double mobileXXL = 32;
  static const double tabletXXL = 48;
  static const double desktopXXL = 64;
}
