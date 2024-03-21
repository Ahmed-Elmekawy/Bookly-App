import 'package:bookly/features/search/presentition/manager/search_bloc/search_cubit.dart';
import 'package:bookly/features/search/presentition/manager/search_bloc/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_list_view_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        var items = cubit.searchModel!.items;
        return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => SearchListViewItem(
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
            itemCount: cubit.searchModel!.items!.length);
      },
    );
  }
}
