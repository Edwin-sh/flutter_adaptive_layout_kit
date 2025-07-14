import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_layout_kit/flutter_adaptive_layout_kit.dart';

void main() {
  group('ResponsiveGridService', () {
    test('should initialize with default values', () {
      final service = ResponsiveGridService();

      // Before setting screen type, should default to mobile values
      expect(service.screenType, isNull);
      expect(service.margin, equals(16.0)); // mobileMargin
      expect(service.gutter, equals(16.0)); // mobileGutter
    });

    test('should update values when screen type is set', () {
      final service = ResponsiveGridService();

      // Set desktop screen type
      service.setScreenType(ScreenType.desktop);

      expect(service.screenType, equals(ScreenType.desktop));
      expect(service.margin, equals(60.0)); // desktopMargin
      expect(service.gutter, equals(30.0)); // desktopGutter
    });

    test('should provide correct screen type checks', () {
      final service = ResponsiveGridService();

      // Test mobile
      service.setScreenType(ScreenType.mobile);
      expect(service.isMobile(), isTrue);
      expect(service.isTablet(), isFalse);
      expect(service.isDesktop(), isFalse);

      // Test tablet
      service.setScreenType(ScreenType.tablet);
      expect(service.isMobile(), isFalse);
      expect(service.isTablet(), isTrue);
      expect(service.isDesktop(), isFalse);

      // Test desktop
      service.setScreenType(ScreenType.desktop);
      expect(service.isMobile(), isFalse);
      expect(service.isTablet(), isFalse);
      expect(service.isDesktop(), isTrue);
    });
  });

  group('FlowItem', () {
    test('should create with default values', () {
      final child = Container();
      final flowItem = FlowItem(child: child);

      expect(flowItem.child, equals(child));
      expect(flowItem.minWidth, equals(0.0));
      expect(flowItem.maxWidth, equals(double.infinity));
    });

    test('should create with custom values', () {
      final child = Container();
      final flowItem = FlowItem(child: child, minWidth: 100.0, maxWidth: 300.0);

      expect(flowItem.child, equals(child));
      expect(flowItem.minWidth, equals(100.0));
      expect(flowItem.maxWidth, equals(300.0));
    });
  });
}
