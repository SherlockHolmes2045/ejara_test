import 'package:ejara/core/base_provider.dart';
import '../api/payment_method_client.dart';
import 'package:dartz/dartz.dart';

import '../models/payment_method.dart';

class PaymentMethodProvider extends BaseProvider {
  final PaymentMethodClient paymentMethodClient;
  Either<Exception, List<PaymentMethod>> paymentMethods = Right([]);

  PaymentMethodProvider(this.paymentMethodClient);

  getPaymentMethods() {
    toggleLoadingState();
    paymentMethodClient.fetchAllPaymentMethods().then((value) {
      paymentMethods = Right(value);
      toggleLoadingState();
    }).catchError((error) {
      toggleLoadingState();
      paymentMethods = Left(error);
    });
  }
}
