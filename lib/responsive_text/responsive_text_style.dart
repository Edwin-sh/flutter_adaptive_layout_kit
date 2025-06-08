import 'package:flutter/material.dart';
import 'package:flutter_adaptive_layout_kit/responsive.dart'; // Updated import

/// Defines a set of [TextStyle]s for different screen sizes.
///
/// This class allows specifying different text styles for mobile, large mobile,
/// tablet, and desktop screens. It provides a method [getResponsiveTextStyle]
/// to retrieve the appropriate style based on the current screen context.
class ResponsiveTextStyle {
  /// Creates a ResponsiveTextStyle.
  ///
  /// Requires [mobile] and [desktop] text styles.
  /// [mobileLarge] and [tablet] styles are optional and have fallbacks.
  /// If any style is null, it defaults to a basic [TextStyle].
  ResponsiveTextStyle({
    required TextStyle? mobile,
    TextStyle? mobileLarge,
    TextStyle? tablet,
    required TextStyle? desktop,
  }) : _mobile = mobile ?? _defaultTextStyle,
       _mobileLarge = mobileLarge,
       _tablet = tablet,
       _desktop = desktop ?? _defaultTextStyle;

  final TextStyle _mobile;
  final TextStyle? _mobileLarge;
  final TextStyle? _tablet;
  final TextStyle _desktop;

  /// A default, empty [TextStyle] used as a fallback if specific styles are not provided.
  static const TextStyle _defaultTextStyle = TextStyle();

  /// Returns the appropriate [TextStyle] based on the current screen size category.
  ///
  /// Uses the [ResponsiveContextExtension] (e.g., `context.isMobile`, `context.isTablet`)
  /// to determine the screen size.
  ///
  /// Fallback logic:
  /// - If `isMobileLarge` and `_mobileLarge` is null, `_mobile` is used.
  /// - If `isTablet` and `_tablet` is null, `_desktop` is used.
  TextStyle getResponsiveTextStyle(BuildContext context) {
    // Using the extension methods from ResponsiveContextExtension
    if (context.isMobile) {
      return _mobile;
    } else if (context.isMobileLarge) {
      return _mobileLarge ?? _mobile;
    } else if (context.isTablet) {
      return _tablet ??
          _desktop; // Fallback to desktop if tablet specific is not provided
    } else {
      return _desktop;
    }
  }
}
