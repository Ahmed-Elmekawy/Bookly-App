import 'package:bookly/core/functions/navigation.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

ClipRRect bookImage(
    {context,
    required String url,
    required double height,
    required double width,
    Items? item,
    String? category}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          if(item!=null&&category!=null) {
            navigateToBookDetailsView(context,
                item: item, category: category);
          }
        },
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: url,
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
          ),
        ),
      ),
    ),
  );
}
