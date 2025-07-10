import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../grid/responsive_grid.dart';

/// Defines a set of [TextStyle]s for different screen sizes.
///
/// This class allows specifying different text styles for mobile, tablet,
/// and desktop screens. It uses the [responsiveGridService] to determine the
/// appropriate style.
class ResponsiveTextStyle {
  /// Creates a [ResponsiveTextStyle].
  ///
  /// Requires [mobile] and [desktop] text styles. The [tablet] style is optional.
  ResponsiveTextStyle({
    required TextStyle? mobile,
    TextStyle? tablet,
    required TextStyle? desktop,
  })  : _mobile = mobile ?? _defaultTextStyle,
        _tablet = tablet,
        _desktop = desktop ?? _defaultTextStyle;

  final TextStyle _mobile;
  final TextStyle? _tablet;
  final TextStyle _desktop;

  static const TextStyle _defaultTextStyle = TextStyle();

  /// Returns the appropriate [TextStyle] based on the current screen type
  /// from the [responsiveGridService].
  TextStyle getResponsiveTextStyle() {
    switch (responsiveGridService.screenType) {
      case ScreenType.mobile:
        return _mobile;
      case ScreenType.tablet:
        return _tablet ?? _desktop;
      case ScreenType.desktop:
        return _desktop;
      case null:
        return _mobile; // Default to mobile style if screen type is not set
    }
  }
}
