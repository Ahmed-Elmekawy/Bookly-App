import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentition/manager/search_bloc/search_cubit.dart';
import 'package:bookly/features/search/presentition/manager/search_bloc/search_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.formKey,
    required this.searchController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        return TextFormField(
          onFieldSubmitted: (value) {
            if (formKey.currentState!.validate()) {
              SearchCubit.get(context).searchBooks(value);
            }
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter name of book";
            }
            return null;
          },
          keyboardType: TextInputType.name,
          controller: searchController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: kGreyColor)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: kYellowColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
              hintText: "Search",
              hintStyle: Styles.montserratRegular14,
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: kGreyColor,
                size: 18,
              )),
          cursorColor: kYellowColor,
        );
      },
    );
  }
}
