import 'dart:async';
import 'dart:developer';

import 'package:book_storage/data/local_data_sources/book_storage/book_dara_source.dart';
import 'package:flutter/material.dart';

import 'core/App.dart';

void main() {
  runApp(const App());
  // runZonedGuarded(
  //   () async {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     final BooksDataSource booksDataSource = BooksDataSource();
  //     await booksDataSource.init();
  //     final allBooks = await booksDataSource.getAll();
  //     log(allBooks.toString());
  //     await booksDataSource.dispose();
  //
  //     runApp(const App());
  //   },
  //   (error, stackTrace) {
  //     log(
  //       '[Main isolate]',
  //       error: error,
  //       stackTrace: stackTrace,
  //     );
  //   },
  // );
}
