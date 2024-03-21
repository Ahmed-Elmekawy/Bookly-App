import 'package:bookly/features/book_details/presentition/views/book_details_view.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:bookly/features/payment/presentation/view/my_cart_view.dart';
import 'package:flutter/material.dart';

void navigateToBookDetailsView(context,
    {required Items item, required String category}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return BookDetailsView(item: item, category: category);
      },
    ),
  );
}

void navigateToMyCartView(context,
    {required double price,
    required double discount,
    required double shipping,
    required String title,
    required String image,
    required String currencyCode}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return MyCartView(
          price: price,
          discount: discount,
          shipping: shipping,
          title: title,
          image: image,
          currencyCode: currencyCode,
        );
      },
    ),
  );
}

void navigateTo(context,
    {required widget}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ),
  );
}