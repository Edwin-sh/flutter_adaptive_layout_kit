import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import '../responsive.dart'; // Assuming this contains desktopBreakpointConstant
import '_grid_constants.dart';

/// Service to manage and provide responsive grid values.
///
/// This service should be initialized with the current [ScreenType]
/// via [setScreenType] (typically by [ResponsiveScreenTypeProvider])
/// to provide appropriate values for margins, gutters, and sizes.
ResponsiveGridService responsiveGridService = ResponsiveGridService();

/// A utility class that provides responsive design values
/// based on the current screen type (mobile, tablet, desktop).
class ResponsiveGridService {
  ResponsiveGridService();

  ScreenType? _currentScreenType;

  /// Sets the current screen type.
  ///
  /// This method is typically called by a widget like [ResponsiveScreenTypeProvider]
  /// that detects screen size changes.
  /// [screenType] is the screen type to set, from the `sizer` package.
  void setScreenType(ScreenType screenType) {
    _currentScreenType = screenType;
  }

  /// Gets the responsive margin based on the current screen type.
  /// Defaults to [mobileMargin] if the screen type is not set.
  double get margin {
    return switch (_currentScreenType) {
      ScreenType.mobile => mobileMargin,
      ScreenType.tablet => tabletMargin,
      ScreenType.desktop => desktopMargin,
      null => mobileMargin,
    };
  }

  /// Gets the responsive gutter (spacing between grid items) based on the current screen type.
  /// Defaults to [mobileGutter] if the screen type is not set.
  double get gutter {
    return switch (_currentScreenType) {
      ScreenType.mobile => mobileGutter,
      ScreenType.tablet => tabletGutter,
      ScreenType.desktop => desktopGutter,
      null => mobileGutter,
    };
  }

  /// Gets the responsive maximum width for a widget based on the current screen type.
  /// Defaults to [mobileWidgetMaxWidth] if the screen type is not set.
  double get maxWidgetWidth {
    return switch (_currentScreenType) {
      ScreenType.mobile => mobileWidgetMaxWidth,
      ScreenType.tablet =>
        desktopWidgetMaxWidth, // Uses desktopWidgetMaxWidth for tablets as well
      ScreenType.desktop => desktopWidgetMaxWidth,
      null => mobileWidgetMaxWidth,
    };
  }

  /// Gets the responsive XS (Extra Small) size based on the current screen type.
  /// Defaults to [mobileXS] if the screen type is not set.
  double get xs {
    return switch (_currentScreenType) {
      ScreenType.mobile => mobileXS,
      ScreenType.tablet => tabletXS,
      ScreenType.desktop => desktopXS,
      null => mobileXS,
    };
  }

  /// Gets the responsive S (Small) size based on the current screen type.
  /// Defaults to [mobileS] if the screen type is not set.
  double get s {
    return switch (_currentScreenType) {
      ScreenType.mobile => mobileS,
      ScreenType.tablet => tabletS,
      ScreenType.desktop => desktopS,
      null => mobileS,
    };
  }

  /// Gets the responsive M (Medium) size based on the current screen type.
  /// Defaults to [mobileM] if the screen type is not set.
  double get m {
    return switch (_currentScreenType) {
      ScreenType.mobile => mobileM,
      ScreenType.tablet => tabletM,
      ScreenType.desktop => desktopM,
      null => mobileM,
    };
  }

  /// Gets the responsive L (Large) size based on the current screen type.
  /// Defaults to [mobileL] if the screen type is not set.
  double get l {
    return switch (_currentScreenType) {
      ScreenType.mobile => mobileL,
      ScreenType.tablet => tabletL,
      ScreenType.desktop => desktopL,
      null => mobileL,
    };
  }

  /// Gets the responsive XL (Extra Large) size based on the current screen type.
  /// Defaults to [mobileXL] if the screen type is not set.
  double get xl {
    return switch (_currentScreenType) {
      ScreenType.mobile => mobileXL,
      ScreenType.tablet => tabletXL,
      ScreenType.desktop => desktopXL,
      null => mobileXL,
    };
  }

  /// Gets the responsive XXL (Extra Extra Large) size based on the current screen type.
  /// Defaults to [mobileXXL] if the screen type is not set.
  double get xxl {
    return switch (_currentScreenType) {
      ScreenType.mobile => mobileXXL,
      ScreenType.tablet => tabletXXL,
      ScreenType.desktop => desktopXXL,
      null => mobileXXL,
    };
  }

  /// Returns a responsive size based on the current screen type.
  ///
  /// [mobile] is the size for mobile screens.
  /// [tablet] is the optional size for tablet screens. If null, [mobile] is used.
  /// [desktop] is the size for desktop screens.
  /// Defaults to [mobile] if the screen type is not set.
  double getResponsiveSize({
    required double mobile,
    double? tablet,
    required double desktop,
  }) {
    return switch (_currentScreenType) {
      ScreenType.mobile => mobile,
      ScreenType.tablet => tablet ?? mobile,
      ScreenType.desktop => desktop,
      null => mobile,
    };
  }
}

/// A widget that provides the current [ScreenType] from `sizer` to the [responsiveGridService]
/// and then builds its UI using the [builder] callback.
///
/// This widget should be placed high in the widget tree, typically above any widgets
/// that need access to responsive grid values through [responsiveGridService].
class ResponsiveScreenTypeProvider extends StatelessWidget {
  /// Creates a ResponsiveScreenTypeProvider.
  ///
  /// The [builder] is called with the current [BuildContext], [Orientation],
  /// and [ScreenType].
  const ResponsiveScreenTypeProvider({super.key, required this.builder});

  /// A builder function that receives the context, orientation, and screen type.
  final Widget Function(
    BuildContext context,
    Orientation orientation,
    ScreenType screenType,
  )
  builder;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      // Uses desktopBreakpointConstant from responsive.dart for Sizer's tablet threshold
      maxTabletWidth: desktopBreakpointConstant,
      builder: (context, orientation, screenType) {
        // Update the service with the current screen type
        responsiveGridService.setScreenType(screenType);
        // Call the user-provided builder
        return builder(context, orientation, screenType);
      },
    );
  }
}
