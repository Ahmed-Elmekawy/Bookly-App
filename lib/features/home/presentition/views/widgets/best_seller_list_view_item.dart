import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/book_image.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:flutter/material.dart';

class BestListViewItem extends StatelessWidget {
  const BestListViewItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.authors,
    required this.averageRating,
    required this.ratingsCount,
    required this.item,
    required this.category,
  });
  final String imageUrl;
  final String title;
  final dynamic authors;
  final dynamic averageRating;
  final int ratingsCount;
  final Items item;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bookImage(
            context: context,
            height: 150,
            width: 110,
            url: imageUrl,
            item: item,
            category: category),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: Styles.gTSectra20,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              for (String x in authors)
                Text(
                  x,
                  style: Styles.montserratMedium14,
                ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Spacer(),
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Color(0xffFFDD4F),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "$averageRating",
                    style: Styles.montserratMedium16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "($ratingsCount)",
                    style: Styles.montserratRegular14,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
