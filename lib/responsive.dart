import 'package:flutter/material.dart';

// Breakpoint definitions
const double mobileBreakpoint = 600;
const double mobileLargeBreakpoint = 800;
const double tabletBreakpoint = 1024;

/// Breakpoint for desktop screens. Note: `desktopBreakpoint` from `sizer` package might be used by `ResponsiveGridProvider`.
const double desktopBreakpointConstant =
    1440; // Renamed to avoid conflict if sizer's desktopBreakpoint is imported

/// A widget that selects a layout based on the current screen size.
///
/// It displays different widgets for mobile, mobileLarge (optional),
/// tablet (optional), and desktop screen sizes, based on predefined breakpoints.
class ResponsiveLayoutBuilder extends StatelessWidget {
  /// Creates a ResponsiveLayoutBuilder.
  ///
  /// Requires [mobile] and [desktop] widgets.
  /// [mobileLarge] and [tablet] widgets are optional.
  const ResponsiveLayoutBuilder({
    super.key,
    required this.mobile,
    required this.desktop,
    this.mobileLarge,
    this.tablet,
  });

  /// Widget to display on mobile screens (width < [mobileBreakpoint]).
  final Widget mobile;

  /// Optional widget to display on large mobile screens
  /// ([mobileBreakpoint] <= width < [mobileLargeBreakpoint]).
  /// If null, [mobile] is used.
  final Widget? mobileLarge;

  /// Optional widget to display on tablet screens
  /// ([mobileLargeBreakpoint] <= width < [tabletBreakpoint]).
  /// If null, and [mobileLarge] is also null, [mobile] is used.
  /// If null, and [mobileLarge] is not null, [mobileLarge] is used.
  /// If not null, this widget is used.
  final Widget? tablet;

  /// Widget to display on desktop screens (width >= [tabletBreakpoint]).
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return desktop;
    } else if (context.isTablet && tablet != null) {
      return tablet!;
    } else if (context.isMobileLarge && mobileLarge != null) {
      return mobileLarge!;
    } else {
      return mobile;
    }
  }
}

/// Extension on [BuildContext] to provide responsive utility methods and properties.
extension ResponsiveContextExtension on BuildContext {
  // Renamed to avoid potential conflicts
  /// Gets the current screen width.
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Gets the current screen height.
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Returns true if the current screen width is less than [mobileBreakpoint].
  bool get isMobile => screenWidth < mobileBreakpoint;

  /// Returns true if the current screen width is between [mobileBreakpoint] (inclusive)
  /// and [mobileLargeBreakpoint] (exclusive).
  bool get isMobileLarge =>
      screenWidth >= mobileBreakpoint && screenWidth < mobileLargeBreakpoint;

  /// Returns true if the current screen width is between [mobileLargeBreakpoint] (inclusive)
  /// and [tabletBreakpoint] (exclusive).
  bool get isTablet =>
      screenWidth >= mobileLargeBreakpoint && screenWidth < tabletBreakpoint;

  /// Returns true if the current screen width is greater than or equal to [tabletBreakpoint].
  bool get isDesktop => screenWidth >= tabletBreakpoint;

  /// Gets a string representation of the current screen category based on width.
  ///
  /// Returns 'desktop', 'tablet', 'mobileLarge', or 'mobile'.
  /// This is a simplified categorization. For `ScreenType` enum from the `sizer` package,
  /// ensure `ResponsiveGridProvider` (or a similar Sizer-aware widget) is used.
  String get screenCategory {
    if (isDesktop) {
      return 'desktop';
    } else if (isTablet) {
      return 'tablet';
    } else if (isMobileLarge) {
      return 'mobileLarge';
    } else {
      return 'mobile';
    }
  }
}
