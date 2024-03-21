import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.montserratBold16.copyWith(color: kWhiteColor),
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: Styles.montserratBold16.copyWith(color: kWhiteColor),
        )
      ],
    );
  }
}