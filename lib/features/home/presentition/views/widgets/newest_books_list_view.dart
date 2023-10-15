import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/laucnh_url.dart';
import 'package:bookly/core/widgets/book_image.dart';
import 'package:bookly/features/home/presentition/manager/home_bloc/home_cubit.dart';
import 'package:bookly/features/home/presentition/manager/home_bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        var items = cubit.newestHomeModel!.items!;
        return SizedBox(
          height: 225,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    Stack(alignment: AlignmentDirectional.bottomEnd, children: [
                      bookImage(
                          context: context,
                          url: items[index].volumeInfo!.imageLinks!.thumbnail!,
                          height: 225,
                          width: 150,
                          item: items[index],
                          category: items[index].volumeInfo!.categories![0]),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: IconButton(
                            onPressed: () async{
                              await launchCustomUr(context, items[index].volumeInfo!.previewLink);
                            },
                            icon: const Icon(
                              Icons.play_circle,
                              size: 40,
                              color: kYellowColor,
                            )),
                      )
                    ]),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: items.length),
          ),
        );
      },
    );
  }
}
