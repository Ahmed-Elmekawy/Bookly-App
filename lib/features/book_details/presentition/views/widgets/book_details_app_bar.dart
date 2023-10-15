import 'package:bookly/core/functions/laucnh_url.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key, required this.buyLink});
  final dynamic buyLink;

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
          if (buyLink != null)
            IconButton(
                onPressed: () async {
                  await launchCustomUr(context, buyLink);
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
