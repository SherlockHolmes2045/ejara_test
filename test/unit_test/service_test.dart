import 'package:ejara/payment_method/api/payment_method_client.dart';
import 'package:ejara/payment_method/models/payment_method.dart';
import 'package:ejara/payment_method/models/payment_method_setting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'service_test.mocks.dart';

class PaymentMethodClientTest extends Mock implements PaymentMethodClient {}

@GenerateMocks([PaymentMethodClientTest])
Future<void> main() async {
  late MockPaymentMethodClientTest paymentMethodClientTest;
  setUpAll(() {
    paymentMethodClientTest = MockPaymentMethodClientTest();
  });
  final mockPaymentMethod = PaymentMethod(
      id: 1,
      code: "MOMO",
      titleEn: "Mobile Money",
      titleFr: "Mobile Money",
      descriptionEn: "Instantly - 3.1% Telco Fees",
      minAmount: 0,
      descriptionFr: "Instantanément - 3.1% de frais",
      iconImage: "");
  test('test fetch payment methods', () async {
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
    final res = await paymentMethodClientTest.fetchAllPaymentMethods();
    expect(res, isA<List<PaymentMethod>>());
    expect(res, model);
  });

  test('test fetch payment methods throws Exception', () {
    when(paymentMethodClientTest.fetchAllPaymentMethods())
        .thenAnswer((_) async {
      throw Exception();
    });
    final res = paymentMethodClientTest.fetchAllPaymentMethods();
    expect(res, throwsException);
  });

  test('test fetch payment method settings', () async {
    final result = <PaymentMethodSetting>[PaymentMethodSetting()];
    when(paymentMethodClientTest
            .fetchPaymentMethodSettings(mockPaymentMethod.id!.toString()))
        .thenAnswer((_) async {
      return result;
    });
    final res = await paymentMethodClientTest
        .fetchPaymentMethodSettings(mockPaymentMethod.id!.toString());
    expect(res, isA<List<PaymentMethodSetting>>());
    expect(res, result);
  });

  test('test fetch payment method settings throws Exception', () {
    when(paymentMethodClientTest
            .fetchPaymentMethodSettings(mockPaymentMethod.id!.toString()))
        .thenAnswer((_) async {
      throw Exception();
    });
    final res = paymentMethodClientTest
        .fetchPaymentMethodSettings(mockPaymentMethod.id!.toString());
    expect(res, throwsException);
  });
}
