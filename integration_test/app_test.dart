import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_integration_test_screenshot/main.dart';

import 'utils/take_screenshot.dart';

void main() {
  /// STEP 2 Setup binding
  final binding = IntegrationTestWidgetsFlutterBinding();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('test', () {

    testWidgets('NEXT', (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      await tester.pumpAndSettle(const Duration(seconds: 2));

      await initScreenshot(tester, binding);
      await takeScreenshot(binding, '01-start-screenshot');

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);


      await takeScreenshot(binding, '02-increase-screenshot');

      final btn = find.byKey(const Key("btn"));

      await tester.tap(btn);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await Future.delayed(const Duration(seconds: 1));
      expect(find.text('HOME2'), findsOneWidget);

      await takeScreenshot(binding, '03-new-screen-screenshot');
    });
  });
}
