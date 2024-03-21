import 'package:bookly/features/payment/presentation/view/widgets/my_cart_app_bar.dart';
import 'package:bookly/features/payment/presentation/view/widgets/thank_you_view_body.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key, required this.total});
  final double total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCartAppBar(),
      body:ThankYouViewBody(total: total),
    );
  }
}