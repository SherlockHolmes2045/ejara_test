import 'package:dartz/dartz.dart';
import 'package:ejara/core/base_provider.dart';

import '../api/payment_method_client.dart';
import '../models/payment_method_setting.dart';

class PaymentMethodSettingProvider extends BaseProvider {
  final PaymentMethodClient paymentMethodClient = PaymentMethodClient();
  Either<Exception, List<PaymentMethodSetting>> paymentMethodSettings =
      Right([]);


  getPaymentMethodSettings(String id) {
    toggleLoadingState();
    paymentMethodClient.fetchPaymentMethodSettings(id).then((value) {
      paymentMethodSettings = Right(value);
      toggleLoadingState();
    }).catchError((error) {
      toggleLoadingState();
      paymentMethodSettings = Left(error);
    });
  }
}
