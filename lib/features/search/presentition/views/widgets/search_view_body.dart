import 'package:bookly/constants.dart';
import 'package:bookly/features/search/presentition/manager/search_bloc/search_cubit.dart';
import 'package:bookly/features/search/presentition/manager/search_bloc/search_states.dart';
import 'package:bookly/features/search/presentition/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_search_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomSearchField(
                    formKey: formKey, searchController: searchController),
                const SizedBox(
                  height: 20,
                ),
                if (state is SearchBooksLoading)
                  const LinearProgressIndicator(
                    color: kYellowColor,
                  ),
                if (SearchCubit.get(context).searchModel != null)
                  const SearchListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
