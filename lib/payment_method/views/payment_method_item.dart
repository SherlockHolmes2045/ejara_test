import 'package:ejara/payment_method/models/payment_method.dart';
import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  final void Function()? onTap;
  final PaymentMethod paymentMethod;
  const PaymentMethodItem({Key? key, this.onTap, required this.paymentMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(241, 241, 250, 1),
        ),
        child: const Icon(
          Icons.credit_card,
          color: Color.fromRGBO(118, 126, 237, 1),
        ),
      ),
      title: Text(
        paymentMethod.titleEn ?? "",
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(108, 112, 158, 1)),
      ),
      subtitle: Text(
        paymentMethod.descriptionFr ?? "",
        style: TextStyle(
          color: Color.fromRGBO(200, 200, 218, 1),
        ),
      ),
    );
  }
}
