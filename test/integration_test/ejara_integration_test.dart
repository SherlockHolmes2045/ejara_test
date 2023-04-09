import 'package:ejara/main.dart' as app;
import 'package:ejara/payment_method/views/payment_method_item.dart';
import 'package:ejara/payment_method/views/wallet_item.dart';
import 'package:ejara/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
      "Test payment methods and payment methods shows up correctly",
          (WidgetTester tester) async {
        SharedPreferences.setMockInitialValues({});
        app.main();
        await tester.pumpAndSettle();
        await tester.tap(find.byType(PaymentMethodItem).first);
        await tester.pumpAndSettle();
        expect(
          tester.widget(find.byKey(const Key("modal.title"))),
          isA<Text>().having((t) => t.data,'data',"Select the ${tester.firstWidget<PaymentMethodItem>(find.byType(PaymentMethodItem)).paymentMethod.titleEn!} method")
        );
        await tester.pumpAndSettle();
        expect(find.byType(WalletItem), findsAtLeastNWidgets(1));
        await tester.tap(find.byType(AppButton).last);
        await tester.pumpAndSettle();
        expect(find.byType(Form), findsOneWidget);
      },
    );
}