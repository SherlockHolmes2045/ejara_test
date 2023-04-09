import 'package:ejara/payment_method/logic/payment_method_provider.dart';
import 'package:ejara/payment_method/logic/payment_method_setting_provider.dart';
import 'package:ejara/payment_method/views/add_payment_method_page.dart';
import 'package:ejara/payment_method/views/payment_method_item.dart';
import 'package:ejara/payment_method/views/wallet_item.dart';
import 'package:ejara/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:provider/provider.dart';

import '../../core/loading_state.dart';
import '../../widgets/appbar.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PaymentMethodProvider>().getPaymentMethods();
    });
  }

  @override
  Widget build(BuildContext context) {
    final paymentMethodProvider = context.watch<PaymentMethodProvider>();
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
              paymentMethodProvider.loadingState == LoadingState.loading
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3),
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                        ),
                      ),
                    )
                  : context
                      .select((PaymentMethodProvider provider) => provider)
                      .paymentMethods
                      .fold((Exception error) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.3),
                        child: const Center(
                          child: Text(
                              "Une erreur est survenue veuillez réessayer"),
                        ),
                      );
                    }, (paymentMethods) {
                return paymentMethods.isEmpty ?  Padding(
                          padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.3),
                          child: const Center(
                            child: Text(
                                "Aucune données pour l'instant réessayer plus tard"),
                          ),
                        ):
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
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
                                          color: const Color.fromRGBO(
                                              158, 160, 191, 1),
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.fontSize),
                                    ),
                                    const SizedBox(
                                      height: 24.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          MoneyFormatter(amount: 20000)
                                              .output
                                              .nonSymbol,
                                          style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  16, 21, 97, 1),
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall
                                                  ?.fontSize),
                                        ),
                                        Text(
                                          "CFA",
                                          style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  106, 110, 153, 1),
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall
                                                  ?.fontSize),
                                        )
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 8.0, top: 16.0),
                                      child: Divider(
                                        color: Color.fromRGBO(245, 244, 246, 1),
                                        thickness: 1.5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Earnings per day",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    210, 212, 226, 1),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: MoneyFormatter(
                                                          amount: 10000)
                                                      .output
                                                      .nonSymbol,
                                                  style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        106, 110, 153, 1),
                                                  ),
                                                ),
                                                const TextSpan(
                                                  text: "CFA",
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        106, 110, 153, 1),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                "Select a payment method",
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(16, 20, 97, 1)),
                              ),
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (BuildContext context,
                                    int paymentMethodIndex) {
                                  return PaymentMethodItem(
                                    paymentMethod:
                                        paymentMethods[paymentMethodIndex],
                                    onTap: () {
                                      context
                                          .read<PaymentMethodSettingProvider>()
                                          .getPaymentMethodSettings(
                                              paymentMethods[paymentMethodIndex]
                                                  .id!
                                                  .toString());
                                      showModalBottomSheet<void>(
                                          context: context,
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(25),
                                                topLeft: Radius.circular(25)),
                                          ),
                                          backgroundColor: Colors.white,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.4,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const SizedBox.shrink(),
                                                          Text(
                                                            "Select the ${paymentMethods[paymentMethodIndex].titleEn!} method",
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontSize: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium
                                                                    ?.fontSize,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    16,
                                                                    20,
                                                                    97,
                                                                    1)),
                                                          ),
                                                          const SizedBox(
                                                            width: 16.0,
                                                          ),
                                                          IconButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      context),
                                                              icon: const Icon(
                                                                Icons.close,
                                                                size: 18,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        210,
                                                                        212,
                                                                        226,
                                                                        1),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                        bottom: 8.0,
                                                      ),
                                                      child: Divider(
                                                        color: Color.fromRGBO(
                                                            245, 244, 246, 1),
                                                        thickness: 1.5,
                                                      ),
                                                    ),
                                                    context
                                                                .watch<
                                                                    PaymentMethodSettingProvider>()
                                                                .loadingState ==
                                                            LoadingState.loading
                                                        ? Padding(
                                                            padding: EdgeInsets.only(
                                                                top: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.3),
                                                            child: const Center(
                                                              child:
                                                                  CircularProgressIndicator
                                                                      .adaptive(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation(
                                                                        Colors
                                                                            .blue),
                                                              ),
                                                            ),
                                                          )
                                                        : context
                                                            .select((PaymentMethodSettingProvider
                                                                    provider) =>
                                                                provider)
                                                            .paymentMethodSettings
                                                            .fold((Exception
                                                                error) {
                                                            return Padding(
                                                              padding: EdgeInsets.only(
                                                                  top: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.3),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                    "Une erreur est survenue veuillez réessayer"),
                                                              ),
                                                            );
                                                          }, (paymentMethodSettings) {
                                                            return Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          16.0),
                                                                  child: ListView
                                                                      .separated(
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemBuilder: (BuildContext context,
                                                                              int
                                                                                  index) {
                                                                            return WalletItem(
                                                                                paymentMethodSetting: paymentMethodSettings[index],
                                                                                paymentMethod: paymentMethods[paymentMethodIndex] //context.read<PaymentMethodProvider>().currentPaymentMethod!,
                                                                                );
                                                                          },
                                                                          separatorBuilder: (BuildContext context,
                                                                              int
                                                                                  index) {
                                                                            return const Divider(
                                                                              color: Color.fromRGBO(245, 244, 246, 1),
                                                                              thickness: 1.5,
                                                                            );
                                                                          },
                                                                          itemCount:
                                                                              paymentMethodSettings.length),
                                                                ),
                                                                const SizedBox(
                                                                  height: 16.0,
                                                                ),
                                                                Row(
                                                                  children: const [
                                                                    Expanded(
                                                                      child:
                                                                          Divider(
                                                                        color: Color.fromRGBO(
                                                                            245,
                                                                            244,
                                                                            246,
                                                                            1),
                                                                        thickness:
                                                                            1.5,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "Or",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color.fromRGBO(
                                                                            200,
                                                                            200,
                                                                            218,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Divider(
                                                                        color: Color.fromRGBO(
                                                                            245,
                                                                            244,
                                                                            246,
                                                                            1),
                                                                        thickness:
                                                                            1.5,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          16.0,
                                                                      right:
                                                                          16.0,
                                                                      top: 32.0,
                                                                      bottom:
                                                                          32.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: const Color
                                                                              .fromRGBO(
                                                                          241,
                                                                          241,
                                                                          250,
                                                                          1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    ),
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            16.0,
                                                                        vertical:
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        const Icon(
                                                                          Icons
                                                                              .add,
                                                                          color: Color.fromRGBO(
                                                                              118,
                                                                              126,
                                                                              237,
                                                                              1),
                                                                          size:
                                                                              18,
                                                                        ),
                                                                        Text(
                                                                          "Another mobile money method",
                                                                          style: TextStyle(
                                                                              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                                                                              color: const Color.fromRGBO(118, 126, 237, 1),
                                                                              fontWeight: FontWeight.bold),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          16.0),
                                                                  child:
                                                                      SizedBox(
                                                                    width: double
                                                                        .infinity,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.07,
                                                                    child:
                                                                        AppButton(
                                                                      text:
                                                                          "Continue",
                                                                      onPressed: () => Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => const AddPaymentMethodPage())),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            );
                                                          })
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const Divider(
                                    color: Color.fromRGBO(245, 244, 246, 1),
                                    thickness: 1.5,
                                  );
                                },
                                itemCount: paymentMethods.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    })
            ],
          ),
        ),
      ),
    );
  }
}
