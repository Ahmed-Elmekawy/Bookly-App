import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/order_info_item.dart';
import 'package:flutter/material.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
    required this.total,
  });
  final double total;
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    int day = dateTime.day;
    int month = dateTime.month;
    int year = dateTime.year;
    String time = "$hour" ":" "$minute";
    String date = "$day" "/" "$month" "/" "$year";
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.montserratSemiBold18,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.montserratMedium16.copyWith(color: kGreyColor),
            ),
            const SizedBox(
              height: 42,
            ),
            OrderInfoItem(
              title: 'Date',
              value: date,
            ),
            const SizedBox(
              height: 20,
            ),
            OrderInfoItem(
              title: 'Time',
              value: time,
            ),
            const SizedBox(
              height: 20,
            ),
            const OrderInfoItem(
              title: 'To',
              value: 'Ahmed Elmekawy',
            ),
            const Divider(
              height: 60,
              thickness: 2,
            ),
            OrderInfoItem(title: "Total", value: "$total"),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
