import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/book_details/data/models/similar_books_model.dart';
import 'package:bookly/features/book_details/presentition/manager/similar_books_bloc/similar_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates> {
  SimilarBooksCubit() : super(SimilarBooksInitial());

  static SimilarBooksCubit get(context) {
    return BlocProvider.of(context);
  }

  SimilarBooksModel? similarBooksModel;

  getSimilarBooks(String category) async {
    emit(SimilarBooksLoading());
    try {
      var data = await ApiService.getData(
          endPoint: 'volumes?Filtering=free-ebooks&q=:$category');
      similarBooksModel = SimilarBooksModel.fromJson(data);
      emit(SimilarBooksSuccess());
    } catch (e) {
      emit(SimilarBooksFailure());
    }
  }

}
