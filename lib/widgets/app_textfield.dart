import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  const AppTextField({Key? key, required this.controller, this.validator, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            label,
            style: const TextStyle(
              color: Color.fromRGBO(106, 110, 153, 1),
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          style: const TextStyle(
              color: Color.fromRGBO(108, 112, 158, 1)
          ),
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(245, 244, 246, 1),
                ),
              ),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color.fromRGBO(16, 20, 97, 1)
              ),
            ),
          ),
        ),
      ],
    );
  }
}
