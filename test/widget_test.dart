import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizzanove/main.dart';

// Import your LoginScreen widget
import 'package:pizzanove/pages/login.dart';

void main() {
  testWidgets('LoginScreen has Login text in AppBar',
      (WidgetTester tester) async {
    // Build the LoginApp
    await tester.pumpWidget(LoginApp());

    // Find the AppBar widget
    final appBarFinder = find.widgetWithText(AppBar, 'Login');

    // Verify that the AppBar exists and has the correct title
    expect(appBarFinder, findsOneWidget);
  });
}
