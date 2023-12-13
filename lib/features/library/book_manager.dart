import 'package:book_storage/domain/models/book_create.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCreationCubit extends Cubit<BookCreate> {
  BookCreationCubit() : super(BookCreate());

  void setTitle(String value) => emit(state.copyWith(title: value));

  void setYear(String value) => emit(state.copyWith(year: value));

  void setPageCount(String value) => emit(state.copyWith(pageCount: value));

  void setPublisher(String value) => emit(state.copyWith(publisher: value));

  void setAuthor(String value) => emit(state.copyWith(author: value));
}
