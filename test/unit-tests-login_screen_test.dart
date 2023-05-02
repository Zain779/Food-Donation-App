import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../lib/login_screen.dart';
import '../lib/button.dart';

void main() {
  testWidgets('Test if Log in button is visible', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    expect(find.byType(Button), findsOneWidget);
  });

  testWidgets('Test if email field is validated', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    final emailField = find.byType(TextFormField).at(0);
    expect(emailField, findsOneWidget);

    await tester.tap(emailField);
    await tester.enterText(emailField, '');
    await tester.pump();

    expect(find.text('Enter Email'), findsOneWidget);
  });

  testWidgets('Test if password field is validated',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    final passwordField = find.byType(TextFormField).at(1);
    expect(passwordField, findsOneWidget);

    await tester.tap(passwordField);
    await tester.enterText(passwordField, '');
    await tester.pump();

    expect(find.text('Enter Password'), findsOneWidget);
  });
}
