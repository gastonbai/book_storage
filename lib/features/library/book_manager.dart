import 'package:book_storage/domain/models/book_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCreationCubit extends Cubit<BookInfo> {
  BookCreationCubit()
      : super(BookInfo(
          title: '',
          year: 0,
          pageCount: 0,
          publisher: '',
          author: '',
        ));

  void setTitle(String value) => emit(state.copyWith(title: value));

  void setYear(String value) => emit(state.copyWith(title: value));

  void setPageCount(String value) => emit(state.copyWith(title: value));

  void setPublisher(String value) => emit(state.copyWith(title: value));

  void setAuthor(String value) => emit(state.copyWith(title: value));
}
