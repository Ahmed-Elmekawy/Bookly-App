import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/book_image.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:flutter/material.dart';

class CustomBookDetails extends StatelessWidget {
  const CustomBookDetails({
    super.key,
    required this.item,
  });

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bookImage(
            height: 243,
            width: 162,
            url: item.volumeInfo!.imageLinks!.thumbnail!),
        const SizedBox(
          height: 10,
        ),
        Text(
          item.volumeInfo!.title!,
          style: Styles.gTSectra30,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        for (String author in item.volumeInfo!.authors!)
          Text(
            author,
            style: Styles.montserratMedium18,
          ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star_rate_rounded,
              color: Color(0xffFFDD4F),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "${item.volumeInfo!.averageRating!}",
              style: Styles.montserratMedium16,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "(${item.volumeInfo!.ratingsCount!})",
              style: Styles.montserratRegular14,
            )
          ],
        ),
      ],
    );
  }
}


