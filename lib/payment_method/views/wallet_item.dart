import 'package:flutter/material.dart';

class WalletItem extends StatelessWidget {
  const WalletItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio(
        value: "Orange Money",
        groupValue: "wallet item",
        onChanged: (String? value) {},
      ),
      title: const Text(
        "Orange money",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(
                16, 20, 97, 1)),
      ),
      subtitle: const Text(
        "+237655480901",
        style: TextStyle(
          color: Color.fromRGBO(200, 200, 218, 1),
        ),
      ),
    );
  }
}
