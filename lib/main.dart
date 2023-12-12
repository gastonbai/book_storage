import 'dart:async';
import 'dart:developer';

import 'package:book_storage/features/library/cubit/library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/App.dart';
import 'data/local_data_sources/book_storage/book_dara_source.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final BooksDataSource booksDataSource = BooksDataSource();

      await booksDataSource.init();

      final libraryCubit = LibraryCubit(booksDataSource);

      runApp(
        BlocProvider.value(
          value: libraryCubit,
          child: const App(),
        ),
      );
    },
    (error, stackTrace) {
      log(
        '[Main isolate]',
        error: error,
        stackTrace: stackTrace,
      );
    },
  );
}
