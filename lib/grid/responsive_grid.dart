import 'package:sizer/sizer.dart';
import '_grid_constants.dart';

/// A singleton instance of [ResponsiveGridService] for easy access to responsive values.
ResponsiveGridService responsiveGridService = ResponsiveGridService();

/// A service that provides responsive design values based on the current screen type.
///
/// This service centralizes the logic for providing corresponding values for margins,
/// gutters, and other layout properties based on the [ScreenType] from the `sizer` package.
class ResponsiveGridService {
  ScreenType? screenType;

  /// Sets the current screen type from the `sizer` package.
  ///
  /// This method is typically called by [ResponsiveScreenInitializer].
  void setScreenType(ScreenType screenType) {
    this.screenType = screenType;
  }

  /// Gets the responsive margin based on the current screen type.
  /// Defaults to [mobileMargin] if the screen type is not set.
  double get margin {
    return switch (screenType) {
      ScreenType.mobile => mobileMargin,
      ScreenType.tablet => tabletMargin,
      ScreenType.desktop => desktopMargin,
      null => mobileMargin,
    };
  }

  /// Gets the responsive gutter (spacing between grid items) based on the current screen type.
  /// Defaults to [mobileGutter] if the screen type is not set.
  double get gutter {
    return switch (screenType) {
      ScreenType.mobile => mobileGutter,
      ScreenType.tablet => tabletGutter,
      ScreenType.desktop => desktopGutter,
      null => mobileGutter,
    };
  }

  /// Gets the responsive maximum width for a widget based on the current screen type.
  /// Defaults to [mobileWidgetMaxWidth] if the screen type is not set.
  double get maxWidgetWidth {
    return switch (screenType) {
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
    return switch (screenType) {
      ScreenType.mobile => mobileXS,
      ScreenType.tablet => tabletXS,
      ScreenType.desktop => desktopXS,
      null => mobileXS,
    };
  }

  /// Gets the responsive S (Small) size based on the current screen type.
  /// Defaults to [mobileS] if the screen type is not set.
  double get s {
    return switch (screenType) {
      ScreenType.mobile => mobileS,
      ScreenType.tablet => tabletS,
      ScreenType.desktop => desktopS,
      null => mobileS,
    };
  }

  /// Gets the responsive M (Medium) size based on the current screen type.
  /// Defaults to [mobileM] if the screen type is not set.
  double get m {
    return switch (screenType) {
      ScreenType.mobile => mobileM,
      ScreenType.tablet => tabletM,
      ScreenType.desktop => desktopM,
      null => mobileM,
    };
  }

  /// Gets the responsive L (Large) size based on the current screen type.
  /// Defaults to [mobileL] if the screen type is not set.
  double get l {
    return switch (screenType) {
      ScreenType.mobile => mobileL,
      ScreenType.tablet => tabletL,
      ScreenType.desktop => desktopL,
      null => mobileL,
    };
  }

  /// Gets the responsive XL (Extra Large) size based on the current screen type.
  /// Defaults to [mobileXL] if the screen type is not set.
  double get xl {
    return switch (screenType) {
      ScreenType.mobile => mobileXL,
      ScreenType.tablet => tabletXL,
      ScreenType.desktop => desktopXL,
      null => mobileXL,
    };
  }

  /// Gets the responsive XXL (Extra Extra Large) size based on the current screen type.
  /// Defaults to [mobileXXL] if the screen type is not set.
  double get xxl {
    return switch (screenType) {
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
    return switch (screenType) {
      ScreenType.mobile => mobile,
      ScreenType.tablet => tablet ?? mobile,
      ScreenType.desktop => desktop,
      null => mobile,
    };
  }
}
