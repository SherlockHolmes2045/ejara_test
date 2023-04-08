// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:ejara/ejara_app.dart';
import 'package:ejara/payment_method/api/payment_method_client.dart';
import 'package:ejara/payment_method/logic/payment_method_provider.dart';
import 'package:ejara/payment_method/logic/payment_method_setting_provider.dart';
import 'package:ejara/payment_method/models/payment_method.dart';
import 'package:ejara/payment_method/views/payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([PaymentMethodClient])
void main() {

  MockPaymentMethodClient mockPaymentMethodClient = MockPaymentMethodClient();
  PaymentMethodProvider paymentMethodProvider = PaymentMethodProvider(mockPaymentMethodClient);
      Widget createHomeScreen() => MultiProvider(
        providers: [
          ChangeNotifierProvider<PaymentMethodProvider>(
              create: (context) => paymentMethodProvider
                  ),
          ChangeNotifierProvider(create: (_) => PaymentMethodSettingProvider()),
        ],
        child: const EjaraApp(),
      );
  group('Home Page Widget Tests', () {
    testWidgets('Testing if the home screen shows correctly', (tester) async {
      when(
        mockPaymentMethodClient.fetchAllPaymentMethods(),
      ).thenAnswer(
            (inv) => Future.value(<PaymentMethod>[
          PaymentMethod(
              id: 1,
              code: "MOMO",
              titleEn: "Mobile Money",
              titleFr: "Mobile Money",
              descriptionEn: "Instantly - 3.1% Telco Fees",
              minAmount: 0,
              descriptionFr: "Instantanément - 3.1% de frais",
              iconImage: "")
        ]),
      );
      await tester.runAsync(() => tester.pumpWidget(createHomeScreen()));
      paymentMethodProvider.getPaymentMethods();
      await tester.pump(const Duration(seconds: 10));
      expect(find.text("Choose a payment method"), findsOneWidget);
      expect(
          find.byType(PaymentMethodItem),
          findsOneWidget);
    });
  });
}
