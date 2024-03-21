import 'package:bookly/features/home/presentition/manager/home_bloc/home_cubit.dart';
import 'package:bookly/features/home/presentition/manager/home_bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        var items = cubit.bestHomeModel!.items;
        return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => BestListViewItem(
                  imageUrl: items![index].volumeInfo!.imageLinks!.thumbnail!,
                  title: items[index].volumeInfo!.title!,
                  authors: items[index].volumeInfo!.authors!,
                  averageRating: items[index].volumeInfo!.averageRating!,
                  ratingsCount: items[index].volumeInfo!.ratingsCount!,
                  item: items[index],
                  category: items[index].volumeInfo!.categories![0],
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: cubit.bestHomeModel!.items!.length);
      },
    );
  }
}
