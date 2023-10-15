import 'package:bookly/constants.dart';
import 'package:bookly/features/book_details/presentition/manager/similar_books_bloc/similar_books_cubit.dart';
import 'package:bookly/features/book_details/presentition/manager/similar_books_bloc/similar_books_states.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView(
      {super.key, required this.item, required this.category});
  final Items item;
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarBooksCubit()..getSimilarBooks(category),
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksStates>(
        builder: (context, state) => Scaffold(
          body: ConditionalBuilder(
            condition: SimilarBooksCubit.get(context).similarBooksModel != null,
            builder: (context) => BookDetailsViewBody(
              item: item,
            ),
            fallback: (context) => const Center(
                child: CircularProgressIndicator(
              color: kYellowColor,
            )),
          ),
        ),
      ),
    );
  }
}
