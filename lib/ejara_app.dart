import 'package:ejara/payment_method/views/payment_method_page.dart';
import 'package:ejara/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'payment_method/logic/payment_method_provider.dart';

class EjaraApp extends StatelessWidget {
  const EjaraApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaymentMethodProvider()),
      ],
      child: MaterialApp(
        title: 'Ejara test',
        debugShowCheckedModeBanner: false,
        theme: EjaraTestTheme.light,
        darkTheme: EjaraTestTheme.dark,
        home: const PaymentMethodPage(),
      ),
    );
  }
}
