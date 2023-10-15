import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/search/data/models/search_model.dart';
import 'package:bookly/features/search/presentition/manager/search_bloc/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) {
    return BlocProvider.of(context);
  }

  SearchModel? searchModel;

  searchBooks(String input) async {
    emit(SearchBooksLoading());
    try {
      var data = await ApiService.getData(
          endPoint: 'volumes?Filtering=free-ebooks&q=:$input');
      searchModel = SearchModel.fromJson(data);
      emit(SearchBooksSuccess());
    } catch (e) {
      emit(SearchBooksFailure());
      print(e.toString());
    }
  }
}
