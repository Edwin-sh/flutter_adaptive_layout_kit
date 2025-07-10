# flutter_adaptive_layout_kit

A Flutter library for creating adaptive layouts and responsive UIs with ease. This package provides a set of widgets and utilities to help you adapt your application's layout and styles to different screen sizes, including mobile, tablet, and desktop. It internally uses the `sizer` package for screen measurements, which is managed by the library.

## Features

*   **ResponsiveLayoutBuilder**: A widget that allows you to define different layouts for various screen breakpoints (e.g., mobile, tablet, desktop).
*   **ResponsiveGridService**: A singleton service, accessible via `responsiveGridService`, that provides dynamic spacing values like margins and gutters based on the current screen type detected by `sizer`.
*   **ResponsiveScreenInitializer**: Initializes screen type detection using the `sizer` package. Wrap your `MaterialApp` with this widget.
*   **ResponsiveText**: A text widget that automatically adjusts its `TextStyle` based on the current screen size, ensuring readability across devices.
*   **ResponsiveTextStyle**: A class to define different text styles for various screen breakpoints.

## Getting Started

### Prerequisites

Ensure you have Flutter installed on your system.

### Installation

Add `flutter_adaptive_layout_kit` to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_adaptive_layout_kit: ^0.0.2 # Replace with the latest version
  # The sizer package is a dependency of flutter_adaptive_layout_kit and will be included automatically.
```

Then, run `flutter pub get` in your terminal.

## Usage

Here's a basic example of how to use the components of this library:

1.  **Wrap your MaterialApp with `ResponsiveScreenInitializer`**:
    To enable screen type detection and make responsive grid values available, wrap your `MaterialApp` with `ResponsiveScreenInitializer`. This widget handles the initialization of `sizer`.

    ```dart
    // main.dart
    import 'package:flutter/material.dart';
    import 'package:flutter_adaptive_layout_kit/flutter_adaptive_layout_kit.dart'; 

    void main() {
      runApp(MyApp());
    }

    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        // Wrap your app with ResponsiveScreenInitializer.
        return ResponsiveScreenInitializer(
          builder: (context, orientation, screenType) {
            // You can now use responsive widgets anywhere in your app.
            return MaterialApp(
              title: 'Flutter Responsive UI Demo',
              home: MyHomePage(),
            );
          },
        );
      }
    }
    ```

2.  **Use `ResponsiveLayoutBuilder` for different layouts**:

    `ResponsiveLayoutBuilder` automatically listens to screen size changes and rebuilds with the appropriate layout.

    ```dart
    // my_home_page.dart
    import 'package:flutter/material.dart';
    import 'package:flutter_adaptive_layout_kit/flutter_adaptive_layout_kit.dart';

    class MyHomePage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: ResponsiveText(
              text: 'Responsive App',
              style: ResponsiveTextStyle(
                mobile: TextStyle(fontSize: 18),
                tablet: TextStyle(fontSize: 22),
                desktop: TextStyle(fontSize: 26),
              ),
            ),
          ),
          body: ResponsiveLayoutBuilder(
            mobile: Center(child: Text('Mobile Layout')),
            tablet: Center(child: Text('Tablet Layout')),
            desktop: Center(child: Text('Desktop Layout')),
          ),
        );
      }
    }
    ```

3.  **Use `ResponsiveText` and `responsiveGridService`**:

    You can access responsive spacing values and other properties directly from the `responsiveGridService` singleton anywhere in your app.

    ```dart
    // my_content_widget.dart
    import 'package:flutter/material.dart';
    import 'package:flutter_adaptive_layout_kit/flutter_adaptive_layout_kit.dart';

    class MyContent extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        final textTheme = Theme.of(context).textTheme;

        // Example 1: Using custom TextStyles
        final customResponsiveStyle = ResponsiveTextStyle(
          mobile: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          tablet: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
          desktop: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.red),
        );

        // Example 2: Using TextStyles from the current Theme
        final themeBasedResponsiveStyle = ResponsiveTextStyle(
          mobile: textTheme.bodyMedium,
          tablet: textTheme.bodyLarge,
          desktop: textTheme.headlineMedium,
        );

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveText(
              text: 'Custom Styled Text!',
              style: customResponsiveStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsiveGridService.s), // Using responsive spacing
            ResponsiveText(
              text: 'Theme Based Text!',
              style: themeBasedResponsiveStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsiveGridService.m), // Using responsive spacing
            Text('Responsive margin: ${responsiveGridService.margin}'),
          ],
        );
      }
    }
    ```

    Ensure `MyContent` is a descendant of `ResponsiveScreenInitializer` to use `responsiveGridService`.

## Additional Information

*   **Issue Tracker**: If you find any bugs or have feature requests, please file an issue at `https://github.com/Edwin-sh/flutter_adaptive_layout_kit/issues`.
*   **Contributing**: Contributions are welcome! Please feel free to fork the repository (`https://github.com/Edwin-sh/flutter_adaptive_layout_kit`), make your changes, and submit a pull request.
*   **License**: This package is licensed under the MIT License. See the `LICENSE` file for details.

---

This library is proudly hosted on GitHub: [https://github.com/Edwin-sh/flutter_adaptive_layout_kit](https://github.com/Edwin-sh/flutter_adaptive_layout_kit)
