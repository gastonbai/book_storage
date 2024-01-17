import 'package:book_storage/domain/models/book_create.dart';
import 'package:book_storage/domain/models/book_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//класс созданый для передачи информации в БД, использует Cubit
class BookCreationCubit extends Cubit<BookInfo> {
  BookCreationCubit() : super(BookInfo());

  void setTitle(String value) => emit(state.copyWith(title: value[0]));

  void setYear(String value) => emit(state.copyWith(year: value));

  void setPageCount(String value) => emit(state.copyWith(pageCount: value));

  void setPublisher(String value) => emit(state.copyWith(publisher: value));

  void setAuthor(String value) => emit(state.copyWith(author: value));
}

