import 'package:ejara/payment_method/views/payment_method_page.dart';
import 'package:ejara/theme/theme.dart';
import 'package:flutter/material.dart';

class EjaraApp extends StatelessWidget {
  const EjaraApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejara test',
      debugShowCheckedModeBanner: false,
      theme: EjaraTestTheme.light,
      darkTheme: EjaraTestTheme.dark,
      home: const PaymentMethodPage(),
    );
  }
}

