import 'package:book_storage/data/local_data_sources/book_storage/book_dara_source.dart';
import 'package:flutter/material.dart';

import 'domain/models/book_info.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  BooksState booksState = BookLoadingState();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => loadData);
  }

  Future<void> loadData() async {
    final BooksDataSource booksDataSource = BooksDataSource();

    try {
      final allBooks = await booksDataSource.getAll();
      booksState = BookSuccessState(books: allBooks);
    } catch (e) {
      booksState = BooksFailedState(message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentBooksState = booksState;

    if (currentBooksState is BooksFailedState) {
      currentBooksState.message;
      return Placeholder();
    }

    if (currentBooksState is BookSuccessState) {
      return BooksListView(
        books: currentBooksState.books,
      );
    }

    return Placeholder();
  }
}

abstract class BooksState {}

class BookLoadingState implements BooksState {}

class BooksFailedState implements BooksState {
  final String message;

  BooksFailedState({required this.message});
}

class BookSuccessState implements BooksState {
  final List<BookInfo> books;

  BookSuccessState({required this.books});
}

class BooksListView extends StatelessWidget {
  final List<BookInfo> books;

  const BooksListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
