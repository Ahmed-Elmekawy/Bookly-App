import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/book_image.dart';
import 'package:bookly/core/widgets/custom_burtton.dart';
import 'package:bookly/core/widgets/order_info_item.dart';
import 'package:bookly/features/payment/presentation/manager/payment_cubit.dart';
import 'package:bookly/features/payment/presentation/view/widgets/payment_method_buttom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody(
      {super.key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.image,
      required this.currencyCode,
      required this.title});
  final String title;
  final String image;
  final double price;
  final double discount;
  final double shipping;
  final String currencyCode;
  @override
  Widget build(BuildContext context) {
    final double total = price.ceil() + shipping;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          bookImage(
            url: image,
            height: 243,
            width: 162,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: Styles.gTSectra30,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          OrderInfoItem(
            title: 'Order Subtotal',
            value: "$price" " " "$currencyCode",
          ),
          const SizedBox(
            height: 3,
          ),
          OrderInfoItem(
            title: 'Discount',
            value: "$discount" " " "$currencyCode",
          ),
          const SizedBox(
            height: 3,
          ),
          OrderInfoItem(
            title: 'Shipping',
            value: "$shipping" " " "$currencyCode",
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          OrderInfoItem(title: 'Total', value: "$total" " " "$currencyCode"),
          const SizedBox(
            height: 16,
          ),
          const Spacer(),
          CustomButton(
            width: double.infinity,
            bottomRight: const Radius.circular(15),
            bottomLeft: const Radius.circular(15),
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            text: 'Complete Payment',
            color: kYellowColor,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  builder: (context) {
                    return BlocProvider(
                        create: (context) => PaymentCubit(),
                        child: PaymentMethodsBottomSheet(total: total));
                  });
            },
          ),
        ],
      ),
    );
  }
}
