import 'package:ejara/payment_method/logic/payment_method_provider.dart';
import 'package:ejara/payment_method/logic/payment_method_setting_provider.dart';
import 'package:ejara/payment_method/models/payment_method.dart';
import 'package:ejara/payment_method/models/payment_method_setting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'service_test.mocks.dart';

void main(){
  late MockPaymentMethodClientTest paymentMethodClientTest;
  late PaymentMethodProvider paymentMethodProvider;
  late PaymentMethodSettingProvider paymentMethodSettingProvider;
  setUpAll(() {
    paymentMethodClientTest = MockPaymentMethodClientTest();
    paymentMethodSettingProvider = PaymentMethodSettingProvider(paymentMethodClientTest);
    paymentMethodProvider = PaymentMethodProvider(paymentMethodClientTest);
  });
  group('Providers tests', () {
    test('test getting payment methods and updating the state', () async {
      final model = <PaymentMethod>[
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
      when(paymentMethodClientTest.fetchAllPaymentMethods())
          .thenAnswer((value) async {
        return model;
      });
      late List<PaymentMethod> statePaymentMethods;
      paymentMethodProvider.paymentMethods.fold((l) => null, (r) {
        statePaymentMethods = r;
      });
      expect(statePaymentMethods.isEmpty, true);
      await paymentMethodProvider.getPaymentMethods();
      paymentMethodProvider.paymentMethods.fold((l) => null, (r) {
        statePaymentMethods = r;
      });
      expect(statePaymentMethods.isEmpty, false);
    });
    
    test('test getting payment method settings  and updating the state', () async {
      final result = <PaymentMethodSetting>[PaymentMethodSetting()];
      when(paymentMethodClientTest.fetchPaymentMethodSettings("1"))
          .thenAnswer((value) async {
        return result;
      });
      late List<PaymentMethodSetting> statePaymentMethodSettings;
      paymentMethodSettingProvider.paymentMethodSettings.fold((l) => null, (r) {
        statePaymentMethodSettings = r;
      });
      expect(statePaymentMethodSettings.isEmpty, true);
      await paymentMethodSettingProvider.getPaymentMethodSettings("1");
      paymentMethodSettingProvider.paymentMethodSettings.fold((l) => null, (r) {
        statePaymentMethodSettings = r;
      });
      expect(statePaymentMethodSettings.isEmpty, false);
    });
    
  });
}