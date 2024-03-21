import 'package:bookly/features/payment/presentation/view/widgets/custom_check_icon.dart';
import 'package:bookly/features/payment/presentation/view/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key, required this.total});
  final double total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: ThankYouCard(total:total),
          ),
          const CustomCheckIcon(),
        ],
      ),
    );
  }
}