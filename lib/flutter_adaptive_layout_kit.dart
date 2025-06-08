/// A Flutter library for creating adaptive layouts and responsive UIs with ease.
///
/// This library provides widgets and utilities to adapt your layouts
/// and styles to different screen sizes (mobile, tablet, desktop).
/// It internally uses the `sizer` package for screen measurements, but this is
/// an implementation detail. Users of this library do not need to interact
/// with `sizer` directly.
///
/// Key features:
/// - [ResponsiveLayoutBuilder]: A widget to build different layouts for different screen sizes.
/// - [ResponsiveContextExtension]: Extension methods on [BuildContext] for easy screen size checks (e.g., `context.isMobile`).
/// - [ResponsiveGridService]: A service to get responsive margins, gutters, and other spacing values.
/// - [ResponsiveScreenTypeProvider]: Initializes screen type detection. Wrap your app's root widget with this.
/// - [ResponsiveText]: A widget for text that adapts its style based on screen size.
/// - [ResponsiveTextStyle]: Defines text styles for various screen breakpoints.
///
/// To use, wrap your app's root widget (e.g., `MaterialApp` or `CupertinoApp`)
/// with [ResponsiveScreenTypeProvider]. This provider handles the necessary
/// initialization for screen type detection. Then, you can use
/// [ResponsiveLayoutBuilder] for layout changes, [responsiveGridService] for dynamic spacing,
/// and [ResponsiveText] for adaptive text throughout your application.
library flutter_adaptive_layout_kit;

// Layout builders and screen utilities
export 'responsive.dart';

// Grid system: constants, service, and provider
export 'grid/_grid_constants.dart';
export 'grid/responsive_grid.dart';

// Responsive text widgets and styles
export 'responsive_text/responsive_text.dart';
export 'responsive_text/responsive_text_style.dart';

// Re-export ScreenType from sizer for convenience if users need it directly,
// though ResponsiveScreenTypeProvider's builder provides it.
export 'package:sizer/sizer.dart' show ScreenType;
