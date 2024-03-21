import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) {
    return BlocProvider.of(context);
  }

  HomeModel? newestHomeModel;
  HomeModel? bestHomeModel;
  getNewestBooks() async {
    emit(NewestBooksLoading());
    try {
      var data = await ApiService.getData(
          endPoint: 'volumes?Filtering=paid-books&Sorting=newest&q=flutter');
      newestHomeModel = HomeModel.fromJson(data);
      emit(NewestBooksSuccess());
    } catch (e) {
      emit(NewestBooksFailure());
    }
  }

  getBestSellerBooks() async {
    emit(BestSellerBooksLoading());
    try {
      var data = await ApiService.getData(
          endPoint:
              'volumes?Filtering=paid-ebooks&q=programming&Sorting=newest&maxResults=40');
      bestHomeModel = HomeModel.fromJson(data);
      emit(BestSellerSuccess());
    } catch (e) {
      emit(BestSellerFailure());
      print(e.toString());
    }
  }
}
