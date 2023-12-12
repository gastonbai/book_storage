import 'package:book_storage/data/local_data_sources/book_storage/book_dara_source.dart';
import 'package:book_storage/domain/models/book_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class LibraryState {}

class LibraryLoadingState extends LibraryState {}

class LibraryLoadedState extends LibraryState {
  final List<BookInfo> books;

  LibraryLoadedState(this.books);
}

class LibraryFailedState extends LibraryState {
  String message;

  LibraryFailedState(this.message);
}

class LibraryCubit extends Cubit<LibraryState> {
  final BooksDataSource dataSource;

  LibraryCubit(this.dataSource) : super(LibraryLoadingState());

  Future<void> init() async {
    try {
      emit(LibraryLoadingState());

      final books = await dataSource.getAll();

      emit(LibraryLoadedState(books));
    } catch (e) {
      emit(LibraryFailedState(e.toString()));
    }
  }

  Future<void> addBook(BookInfo book) async {
    try {
      emit(LibraryLoadingState());

      final newBook = await dataSource.create(book);
      final books = await dataSource.getAll();

      emit(LibraryLoadedState(books));
    } catch (e) {
      emit(LibraryFailedState(e.toString()));
    }
  }
}
