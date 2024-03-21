import 'package:bookly/features/payment/presentation/view/widgets/my_cart_app_bar.dart';
import 'package:bookly/features/payment/presentation/view/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({
    super.key,
    required this.price,
    required this.discount,
    required this.shipping,
    required this.image,
    required this.currencyCode, required this.title,
  });
  final String title;
  final String image;
  final String currencyCode;
  final double price;
  final double discount;
  final double shipping;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCartAppBar(title: 'My Cart'),
      body: MyCartViewBody(
          price: price,
          discount: discount,
          shipping: shipping,
          image: image,
          currencyCode: currencyCode, title: title,),
    );
  }
}
