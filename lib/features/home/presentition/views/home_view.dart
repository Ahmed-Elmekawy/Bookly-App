import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentition/manager/home_bloc/home_cubit.dart';
import 'package:bookly/features/home/presentition/manager/home_bloc/home_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return ConditionalBuilder(
            condition:
                cubit.newestHomeModel != null && cubit.bestHomeModel != null,
            builder: (context) => const HomeViewBody(),
            fallback: (context) => const Column(
              children: [
                HomeAppBar(),
                Center(
                    child: CircularProgressIndicator(
                  color: kYellowColor,
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
