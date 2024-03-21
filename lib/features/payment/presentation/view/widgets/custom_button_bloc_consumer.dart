import 'dart:developer';
import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/custom_snack_bar.dart';
import 'package:bookly/core/functions/navigation.dart';
import 'package:bookly/core/utils/api_keys.dart';
import 'package:bookly/core/widgets/custom_burtton.dart';
import 'package:bookly/features/payment/data/models/payment_intent_input_model.dart';
import 'package:bookly/features/payment/data/models/paypal/input_paybal_model.dart';
import 'package:bookly/features/payment/presentation/manager/payment_cubit.dart';
import 'package:bookly/features/payment/presentation/manager/payment_states.dart';
import 'package:bookly/features/payment/presentation/view/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
    required this.total,
  });
  final double total;
  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          navigateTo(context, widget: ThankYouView(total: total));
        } else if (state is PaymentFailure) {
          Navigator.pop(context);
          customSnackBar(context, "There was an error");
        }
      },
      builder: (context, state) => CustomButton(
        color: kYellowColor,
        onPressed: () {
          isPaypal ? paypalPayment(context) : stripePayment(context);
        },
        text: "Continue",
        width: double.infinity,
      ),
    );
  }

  void paypalPayment(BuildContext context) {
    ItemModelInput itemModelInput =
        ItemModelInput(price: "${total.ceil()}", currency: "USD");
    List<ItemModelInput> items = [itemModelInput];
    InputPaypalModel inputPaypalModel = InputPaypalModel(
        total: "${total.ceil()}", currency: "USD", items: items);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [inputPaypalModel.toJson()],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          navigateTo(context, widget: ThankYouView(total: total));
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          Navigator.pop(context);
        },
      ),
    ));
  }

  void stripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
        customerId: "cus_PkxH0x4HgNOo6p",
        amount: "${total.ceil()}",
        currency: "EGP");
    PaymentCubit.get(context).makePayment(paymentIntentInputModel);
  }
}
