import 'package:sizer/sizer.dart';
import 'grid_constants.dart';

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
  /// Defaults to [GridConstants.mobileMargin] if the screen type is not set.
  double get margin {
    return switch (screenType) {
      ScreenType.mobile => GridConstants.mobileMargin,
      ScreenType.tablet => GridConstants.tabletMargin,
      ScreenType.desktop => GridConstants.desktopMargin,
      null => GridConstants.mobileMargin,
    };
  }

  /// Gets the responsive gutter (spacing between grid items) based on the current screen type.
  /// Defaults to [GridConstants.mobileGutter] if the screen type is not set.
  double get gutter {
    return switch (screenType) {
      ScreenType.mobile => GridConstants.mobileGutter,
      ScreenType.tablet => GridConstants.tabletGutter,
      ScreenType.desktop => GridConstants.desktopGutter,
      null => GridConstants.mobileGutter,
    };
  }

  /// Gets the responsive maximum width for a widget based on the current screen type.
  /// For tablets, it uses dynamic logic based on the stored context.
  /// Defaults to [GridConstants.mobileWidgetMaxWidth] if the screen type is not set.
  double get maxWidgetWidth {
    return switch (screenType) {
      ScreenType.mobile => GridConstants.mobileWidgetMaxWidth,
      ScreenType.tablet => GridConstants.getTabletWidgetMaxWidth(),
      ScreenType.desktop => GridConstants.desktopWidgetMaxWidth,
      null => GridConstants.mobileWidgetMaxWidth,
    };
  }

  /// Gets the responsive XS (Extra Small) size based on the current screen type.
  /// Defaults to [GridConstants.mobileXS] if the screen type is not set.
  double get xs {
    return switch (screenType) {
      ScreenType.mobile => GridConstants.mobileXS,
      ScreenType.tablet => GridConstants.tabletXS,
      ScreenType.desktop => GridConstants.desktopXS,
      null => GridConstants.mobileXS,
    };
  }

  /// Gets the responsive S (Small) size based on the current screen type.
  /// Defaults to [GridConstants.mobileS] if the screen type is not set.
  double get s {
    return switch (screenType) {
      ScreenType.mobile => GridConstants.mobileS,
      ScreenType.tablet => GridConstants.tabletS,
      ScreenType.desktop => GridConstants.desktopS,
      null => GridConstants.mobileS,
    };
  }

  /// Gets the responsive M (Medium) size based on the current screen type.
  /// Defaults to [GridConstants.mobileM] if the screen type is not set.
  double get m {
    return switch (screenType) {
      ScreenType.mobile => GridConstants.mobileM,
      ScreenType.tablet => GridConstants.tabletM,
      ScreenType.desktop => GridConstants.desktopM,
      null => GridConstants.mobileM,
    };
  }

  /// Gets the responsive L (Large) size based on the current screen type.
  /// Defaults to [GridConstants.mobileL] if the screen type is not set.
  double get l {
    return switch (screenType) {
      ScreenType.mobile => GridConstants.mobileL,
      ScreenType.tablet => GridConstants.tabletL,
      ScreenType.desktop => GridConstants.desktopL,
      null => GridConstants.mobileL,
    };
  }

  /// Gets the responsive XL (Extra Large) size based on the current screen type.
  /// Defaults to [GridConstants.mobileXL] if the screen type is not set.
  double get xl {
    return switch (screenType) {
      ScreenType.mobile => GridConstants.mobileXL,
      ScreenType.tablet => GridConstants.tabletXL,
      ScreenType.desktop => GridConstants.desktopXL,
      null => GridConstants.mobileXL,
    };
  }

  /// Gets the responsive XXL (Extra Extra Large) size based on the current screen type.
  /// Defaults to [GridConstants.mobileXXL] if the screen type is not set.
  double get xxl {
    return switch (screenType) {
      ScreenType.mobile => GridConstants.mobileXXL,
      ScreenType.tablet => GridConstants.tabletXXL,
      ScreenType.desktop => GridConstants.desktopXXL,
      null => GridConstants.mobileXXL,
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

  /// Checks if the current screen type is mobile.
  ///
  /// Returns true if the screen type is [ScreenType.mobile], false otherwise.
  ///
  bool isMobile() {
    return screenType == ScreenType.mobile;
  }

  /// Checks if the current screen type is tablet.
  ///
  /// Returns true if the screen type is [ScreenType.tablet], false otherwise.
  ///
  bool isTablet() {
    return screenType == ScreenType.tablet;
  }

  /// Checks if the current screen type is desktop.
  ///
  /// Returns true if the screen type is [ScreenType.desktop], false otherwise.
  ///
  bool isDesktop() {
    return screenType == ScreenType.desktop;
  }
}
