import 'package:ejara/payment_method/models/payment_method_setting.dart';
import 'package:flutter/material.dart';

import '../models/payment_method.dart';

class WalletItem extends StatelessWidget {
  final PaymentMethodSetting paymentMethodSetting;
  final PaymentMethod paymentMethod;

  const WalletItem(
      {Key? key,
      required this.paymentMethodSetting,
      required this.paymentMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio<PaymentMethodSetting>(
        value: paymentMethodSetting,
        groupValue: null,
        onChanged: (PaymentMethodSetting? value) {},
      ),
      title: Text(
        paymentMethod.titleFr ?? "",
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Color.fromRGBO(16, 20, 97, 1)),
      ),
      subtitle: Text(
        paymentMethodSetting.identification ?? "",
        style: const TextStyle(
          color: Color.fromRGBO(200, 200, 218, 1),
        ),
      ),
    );
  }
}
