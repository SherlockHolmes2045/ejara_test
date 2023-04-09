// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:ejara/payment_method/api/payment_method_client.dart';
import 'package:ejara/payment_method/logic/payment_method_provider.dart';
import 'package:ejara/payment_method/logic/payment_method_setting_provider.dart';
import 'package:ejara/payment_method/models/payment_method.dart';
import 'package:ejara/payment_method/models/payment_method_setting.dart';
import 'package:ejara/payment_method/payment_method.dart';
import 'package:ejara/payment_method/views/add_payment_method_page.dart';
import 'package:ejara/payment_method/views/payment_method_item.dart';
import 'package:ejara/payment_method/views/wallet_item.dart';
import 'package:ejara/widgets/app_button.dart';
import 'package:ejara/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([PaymentMethodClient])
void main() {
  MockPaymentMethodClient mockPaymentMethodClient = MockPaymentMethodClient();

  Widget createHomePage() => MultiProvider(
        providers: [
          ChangeNotifierProvider<PaymentMethodProvider>(
              create: (context) =>
                  PaymentMethodProvider(mockPaymentMethodClient)),
          ChangeNotifierProvider(
              create: (_) =>
                  PaymentMethodSettingProvider(mockPaymentMethodClient)),
        ],
        child: const MaterialApp(home: PaymentMethodPage()),
      );

  group('UI unit tests', () {
    testWidgets(
        'Testing if the home screen shows correctly with payment methods',
        (tester) async {
      when(mockPaymentMethodClient.fetchAllPaymentMethods())
          .thenAnswer((value) async {
        return <PaymentMethod>[
          PaymentMethod(
              id: 1,
              code: "MOMO",
              titleEn: "Mobile Money",
              titleFr: "Mobile Money",
              descriptionEn: "Instantly - 3.1% Telco Fees",
              minAmount: 0,
              descriptionFr: "Instantanément - 3.1% de frais",
              iconImage: "")
        ];
      });
      when(mockPaymentMethodClient.fetchPaymentMethodSettings("1"))
          .thenAnswer((value) async {
        return <PaymentMethodSetting>[PaymentMethodSetting()];
      });
      await tester.runAsync(() => tester.pumpWidget(createHomePage()));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentMethodItem), findsOneWidget);
      await tester.tap(find.byType(PaymentMethodItem));
      await tester.pumpAndSettle();
      expect(find.byType(WalletItem), findsOneWidget);
    });
    testWidgets('Testing if the form page show correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: AddPaymentMethodPage(),
      ));
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(AppTextField), findsNWidgets(2));
      expect(find.byType(AppButton), findsOneWidget);
    });

  });
}
