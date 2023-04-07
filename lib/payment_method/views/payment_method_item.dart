import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(241, 241, 250, 1),
        ),
        child: Icon(
          Icons.credit_card,
          color: Color.fromRGBO(118, 126, 237, 1),
        ),
      ),
      title: Text(
        "Cash payment",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(108, 112, 158, 1)),
      ),
      subtitle: Text(
        "Fees: Offer",
        style: TextStyle(
          color: Color.fromRGBO(200, 200, 218, 1),
        ),
      ),
    );
  }
}
