import 'package:bookly/core/widgets/book_image.dart';
import 'package:bookly/features/book_details/presentition/manager/similar_books_bloc/similar_books_cubit.dart';
import 'package:bookly/features/book_details/presentition/manager/similar_books_bloc/similar_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksStates>(
      builder: (context, state) {
        var items = SimilarBooksCubit.get(context).similarBooksModel!.items!;
        return SizedBox(
          height: 128,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (items[index].volumeInfo!.imageLinks != null) {
                  return bookImage(
                      context: context,
                      height: 128,
                      width: 80,
                      url: items[index].volumeInfo!.imageLinks!.thumbnail!,
                      item: items[index],
                      category: items[index].volumeInfo!.categories![0]);
                } else {
                  return const SizedBox(
                    height: 1,
                  );
                }
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
              itemCount: items.length),
        );
      },
    );
  }
}
