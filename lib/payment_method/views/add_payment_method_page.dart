import 'package:ejara/widgets/app_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_button.dart';
import '../../widgets/appbar.dart';

class AddPaymentMethodPage extends StatefulWidget {
  const AddPaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<AddPaymentMethodPage> createState() => _AddPaymentMethodPageState();
}

class _AddPaymentMethodPageState extends State<AddPaymentMethodPage> {
  late TextEditingController _phoneController;
  late TextEditingController _nameController;
  String dropdownvalue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 250, 1),
      extendBodyBehindAppBar: false,
      appBar: const Appbar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "New mobile money",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium?.fontSize,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(16, 20, 97, 1)),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              Form(
                  child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      value: "Test",
                      style: const TextStyle(
                          color: Color.fromRGBO(108, 112, 158, 1)),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(245, 244, 246, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(16, 20, 97, 1)),
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 15,
                        color: Color.fromRGBO(108, 112, 158, 1),
                      ),
                      items: ["Test", "hey"].map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  AppTextField(
                    controller: _phoneController,
                    label: "Phone number",
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  AppTextField(
                    controller: _phoneController,
                    label: "Full name",
                  )
                ],
              )),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  Transform.scale(
                      scale: 0.5,
                      child: CupertinoSwitch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: const Color.fromRGBO(79, 89, 232, 1),
                      )),
                  const Text(
                    "Save as payment method",
                    style: TextStyle(
                      color: Color.fromRGBO(106, 110, 153, 1),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.26,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.07,
                child: AppButton(
                  text: "Continue",
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddPaymentMethodPage())),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
