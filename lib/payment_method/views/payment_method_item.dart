import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  final void Function()? onTap;

  const PaymentMethodItem({Key? key, this.onTap}) : super(key: key);

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
      title: const Text(
        "Cash payment",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(108, 112, 158, 1)),
      ),
      subtitle: const Text(
        "Fees: Offer",
        style: TextStyle(
          color: Color.fromRGBO(200, 200, 218, 1),
        ),
      ),
    );
  }
}
