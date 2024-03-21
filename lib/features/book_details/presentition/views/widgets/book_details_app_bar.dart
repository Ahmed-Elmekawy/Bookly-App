import 'package:bookly/core/functions/navigation.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key, required this.item});
  final Items item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.yellow,
                size: 32,
              )),
          const Spacer(),
          IconButton(
              onPressed: () {
                navigateToMyCartView(context,
                    price: item.saleInfo!.listPrice!.amount!,
                    discount: 0,
                    shipping: 50,
                    title: item.volumeInfo!.title!,
                    image: item.volumeInfo!.imageLinks!.thumbnail!,
                    currencyCode: item.saleInfo!.listPrice!.currencyCode!);
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.yellow,
                size: 25,
              ))
        ],
      ),
    );
  }
}
