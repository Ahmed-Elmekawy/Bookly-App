import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';
import 'home_app_bar.dart';
import 'newest_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppBar(),
          NewestBooksListView(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Newest Seller",
              style: Styles.montserratSemiBold18,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 20, bottom: 20),
            child: BestSellerListView(),
          )
        ],
      ),
    );
  }
}
