import 'dart:io';

/// STEP 3 initial (only Android)
initScreenshot(tester, binding) async {
  if(Platform.isAndroid) {
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
  }
}

/// STEP 4 Take Screenshot
takeScreenshot(binding, filename) async {
  await binding.takeScreenshot(filename);
}