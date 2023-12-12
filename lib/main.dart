import 'package:book_storage/features/library/cubit/library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/App.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => LibraryCubit(),
    child: App(),
  ));
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
