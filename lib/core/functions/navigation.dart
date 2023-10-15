import 'package:bookly/features/book_details/presentition/views/book_details_view.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:flutter/material.dart';

void navigateToBookDetailsView(context,
    {required Items item, required String category}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return BookDetailsView(
            item: item, category: category);
      },
    ),
  );
}
