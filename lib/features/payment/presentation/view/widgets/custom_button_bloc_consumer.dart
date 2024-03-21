import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/custom_snack_bar.dart';
import 'package:bookly/core/functions/navigation.dart';
import 'package:bookly/core/widgets/custom_burtton.dart';
import 'package:bookly/features/payment/data/models/payment_intent_input_model.dart';
import 'package:bookly/features/payment/presentation/manager/payment_cubit.dart';
import 'package:bookly/features/payment/presentation/manager/payment_states.dart';
import 'package:bookly/features/payment/presentation/view/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          PaymentIntentInputModel paymentIntentInputModel =
              PaymentIntentInputModel(
                  customerId: "cus_PkxH0x4HgNOo6p",
                  amount: "${total.ceil()}",
                  currency: "EGP");
          PaymentCubit.get(context).makePayment(paymentIntentInputModel);
        },
        text: "Continue",
        width: double.infinity,
      ),
    );
  }
}
