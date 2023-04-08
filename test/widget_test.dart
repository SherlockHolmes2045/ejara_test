// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:ejara/ejara_app.dart';
import 'package:ejara/payment_method/logic/payment_method_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  Widget createHomeScreen() => ChangeNotifierProvider<PaymentMethodProvider>(
        create: (context) => PaymentMethodProvider(),
        child: const EjaraApp(),
      );
  group('Home Page Widget Tests', () {
    testWidgets('Testing if the home screen shows', (tester) async {
      await tester.runAsync(() => tester.pumpWidget(createHomeScreen()));
      expect(find.text("Choose a payment method"), findsOneWidget);
    });
  });
}
