import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '_global_context.dart';
import 'grid/responsive_grid.dart';

// Breakpoint definitions
const double mobileBreakpoint = 600;
const double mobileLargeBreakpoint = 800;
const double tabletBreakpoint = 1024;
const double desktopBreakpointConstant = 1440;

/// A widget that selects a layout based on the current screen size.
///
/// It uses the [responsiveGridService] to determine the current [ScreenType]
/// from the `sizer` package and displays the corresponding widget.
class ResponsiveLayoutBuilder extends StatelessWidget {
  /// Creates a ResponsiveLayoutBuilder.
  ///
  /// Requires [mobile] and [desktop] widgets. The [tablet] widget is optional.
  const ResponsiveLayoutBuilder({
    super.key,
    required this.mobile,
    required this.desktop,
    this.tablet,
  });

  /// Widget to display on mobile screens.
  final Widget mobile;

  /// Optional widget to display on tablet screens.
  /// If null, [mobile] is used.
  final Widget? tablet;

  /// Widget to display on desktop screens.
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return switch (responsiveGridService.screenType) {
      ScreenType.desktop => desktop,
      ScreenType.tablet => tablet ?? mobile,
      ScreenType.mobile => mobile,
      null => mobile, // Default to mobile if screen type is not set
    };
  }
}

/// A widget that initializes the [ResponsiveGridService] with the current screen size.
///
/// This widget should be placed at the root of the widget tree, typically wrapping
/// the `MaterialApp`, to ensure that the [responsiveGridService] is available
/// to all descendant widgets.
class ResponsiveScreenInitializer extends StatelessWidget {
  /// A builder function that receives the context, orientation, and screen type.
  final Widget Function(
    BuildContext context,
    Orientation orientation,
    ScreenType screenType,
  )
  builder;

  /// Creates a [ResponsiveScreenInitializer].
  const ResponsiveScreenInitializer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      maxTabletWidth: desktopBreakpointConstant,
      builder: (context, orientation, screenType) {
        responsiveGridService.setScreenType(screenType);
        GlobalContext.setContext(context);
        return builder(context, orientation, screenType);
      },
    );
  }
}
