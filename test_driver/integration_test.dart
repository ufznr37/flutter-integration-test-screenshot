import 'dart:io';
import 'package:integration_test/integration_test_driver_extended.dart';

/// STEP 1 Create Integration Driver
Future<void> main() async {
  try {
    const folderPath = 'screenshots';

    /// Delete old screenshots
    final dir = Directory(folderPath);
    await dir.delete(recursive: true);

    /// Setpup Driver
    await integrationDriver(
      onScreenshot: (name, screenshotBytes, [args]) async {
        final File image = await File('screenshots/$name.png').create(recursive: true);
        image.writeAsBytesSync(screenshotBytes);
        return true;
      },
    );
  } catch (e) {
    print('Error occurred: $e');
  }
}