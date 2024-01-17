import 'package:book_storage/data/local_data_sources/book_storage/book_dara_source.dart';
import 'package:book_storage/domain/models/book_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//cubit - библиотека

//подключение cubit в проект для обновления состояния экрана, создание состояний
sealed class LibraryState {}

//состояние загружается
class LibraryLoadingState extends LibraryState {}

//состояние заггружено, готово
class LibraryLoadedState extends LibraryState {
  final List<BookInfo> books;

  LibraryLoadedState(this.books);
}

//состояние ошибки
class LibraryFailedState extends LibraryState {
  String message;

  LibraryFailedState(this.message);
}

//связкак состояний, условия для них
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
