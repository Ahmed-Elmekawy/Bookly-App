import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/custom_snack_bar.dart';
import 'package:bookly/core/functions/laucnh_url.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_burtton.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:flutter/material.dart';
import 'book_details_app_bar.dart';
import 'custom_book_details.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({required this.item, super.key});
  final Items item;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookDetailsAppBar(buyLink: item.saleInfo!.buyLink),
          const SizedBox(
            height: 30,
          ),
          CustomBookDetails(item: item),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customButton(
                  onPressed: () async {
                    if (item.saleInfo!.buyLink != null) {
                      await launchCustomUr(context, item.saleInfo!.buyLink);
                    } else if (item.saleInfo!.buyLink == null &&
                        item.accessInfo!.pdf!.isAvailable == true) {
                      await launchCustomUr(
                          context, item.accessInfo!.pdf!.acsTokenLink);
                    } else {
                      customSnackBar(context, "Not Available");
                    }
                  },
                  text: item.saleInfo!.buyLink != null
                      ? "Not Free"
                      : "Free Download",
                  topLeft: const Radius.circular(20),
                  bottomLeft: const Radius.circular(20)),
              customButton(
                  onPressed: () async {
                    await launchCustomUr(context, item.volumeInfo!.previewLink);
                  },
                  text: item.volumeInfo!.previewLink != null
                      ? "preview"
                      : "Not Available",
                  topRight: const Radius.circular(20),
                  bottomRight: const Radius.circular(20),
                  color: kYellowColor),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 20, left: 20),
            child:
                Text("You can also like", style: Styles.montserratSemiBold14),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 30),
            child: SimilarBooksListView(),
          ),
        ],
      ),
    );
  }
}


