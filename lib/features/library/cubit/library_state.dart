import '../../../domain/models/book_info.dart';

sealed class LibraryState {
  LibraryState get state;
}

class LibraryLoadingState extends LibraryState {
  @override
  // TODO: implement state
  LibraryState get state => throw UnimplementedError();
}

class LibraryLoadedState extends LibraryState {
  List<BookInfo> books;

  LibraryLoadedState({
    required this.books,
  });

  @override
  // TODO: implement state
  LibraryState get state => throw UnimplementedError();
}

class LibraryErrorState extends LibraryState {
  final String message;

  LibraryErrorState({
    required this.message,
  });

  @override
  // TODO: implement state
  LibraryState get state => throw UnimplementedError();
}