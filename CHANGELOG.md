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
* Introduces `ResponsiveGridService` and `ResponsiveScreenTypeProvider` for responsive spacing and grid management, powered by the `sizer` package.
* Features `ResponsiveText` and `ResponsiveTextStyle` for text that adapts its style to different screen breakpoints.
* Basic example and documentation updated to reflect the new package name and structure.
