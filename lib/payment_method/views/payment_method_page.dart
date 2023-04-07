import 'package:ejara/payment_method/views/payment_method_item.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 250, 1),
      extendBodyBehindAppBar: false,
      appBar: const Appbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Choose a payment method",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium?.fontSize,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(16, 20, 97, 1)),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.snippet_folder_rounded,
                        color: Color.fromRGBO(174, 181, 255, 1),
                        size: 50,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Ejara Flex",
                        style: TextStyle(
                            color: const Color.fromRGBO(158, 160, 191, 1),
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontSize),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "20000",
                            style: TextStyle(
                                color: const Color.fromRGBO(16, 21, 97, 1),
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.fontSize),
                          ),
                          Text(
                            "CFA",
                            style: TextStyle(
                                color: const Color.fromRGBO(106, 110, 153, 1),
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.fontSize),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0, top: 16.0),
                        child: Divider(
                          color: Color.fromRGBO(245, 244, 246, 1),
                          thickness: 1.5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Earnings per day",
                              style: TextStyle(
                                  color: Color.fromRGBO(210, 212, 226, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "10000CFA",
                              style: TextStyle(
                                color: const Color.fromRGBO(106, 110, 153, 1),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Select a payment method",
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium?.fontSize,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(16, 20, 97, 1)),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return PaymentMethodItem();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: Color.fromRGBO(245, 244, 246, 1),
                      thickness: 1.5,
                    );
                  },
                  itemCount: 4,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
