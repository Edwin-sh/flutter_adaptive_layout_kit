# 0.0.3

* **New Feature**: Added `ResponsiveFlowLayout` widget for creating adaptive grid layouts that automatically arrange items in rows while respecting minimum and maximum width constraints.
* **New Feature**: Added `FlowItem` class to define flexible layout items with configurable width boundaries.
* **New Feature**: Added alignment enums `HorizontalFlowAxisAlignment` and `VerticalFlowAxisAlignment` for precise layout control.
* **New Feature**: Added convenience methods `isMobile()`, `isTablet()`, and `isDesktop()` to `ResponsiveGridService` for easier screen type checking.
* **Improvement**: Enhanced global context management with better error handling and initialization validation.
* **Improvement**: Optimized import statements across all library files to use relative imports and reduce circular dependencies.
* **Improvement**: Updated package description to include responsive flow layouts.
* **Documentation**: Added comprehensive examples and documentation for the new ResponsiveFlowLayout system.
* **Code Organization**: Separated FlowItem and alignment enums into dedicated files for better maintainability.
* **Export Updates**: Updated main library exports to include all new ResponsiveFlowLayout components.

## 0.0.2

* **Breaking Change**: Refactored the API to centralize screen type logic in `ResponsiveGridService`.
* Removed `ResponsiveContextExtension`. Screen type checks like `context.isMobile` are no longer available.
* Introduced `ResponsiveScreenInitializer` to be placed at the root of the app. This widget initializes the `sizer` package and updates the `responsiveGridService`.
* `ResponsiveGridService` is now a singleton instance that can be accessed globally via `responsiveGridService`.
* `ResponsiveLayoutBuilder` and `ResponsiveText` now use the `responsiveGridService` to determine the screen type.

## 0.0.1

* Initial release of `flutter_adaptive_layout_kit`.
* Clarified that `ResponsiveScreenTypeProvider` handles `Sizer` initialization internally.
* Includes `ResponsiveLayoutBuilder` for adaptive layouts based on screen size.
* Provides `ResponsiveContextExtension` for easy screen size checks.
* Introduces `ResponsiveGridService` and `ResponsiveScreenTypeProvider` for responsive spacing and grid management.
* Features `ResponsiveText` and `ResponsiveTextStyle` for text that adapts its style to different screen breakpoints.
* Basic example and documentation updated to reflect the new package name and structure