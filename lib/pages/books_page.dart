import 'package:book_storage/data/local_data_sources/book_storage/book_dara_source.dart';
import 'package:book_storage/features/library/cubit/library_state.dart';
import 'package:book_storage/features/library/widgets/book_created_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/models/book_info.dart';
import '../features/library/views/library_error_view.dart';
import '../features/library/views/library_loaded_view.dart';
import '../features/library/views/library_loading_view.dart';

// class BooksPage extends StatefulWidget {
//   const BooksPage({super.key});
//
//   @override
//   State<BooksPage> createState() => LibraryState();
// }
//
// class _LibraryState extends State<BooksPage> {
//   LibraryState libraryState = LibraryLoadedState(books: []);
//
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() => loadData);
//   }
//
//   Future<void> loadData() async {
//     final BooksDataSource booksDataSource = BooksDataSource();
//
//     try {
//       final allBooks = await booksDataSource.getAll();
//       libraryState = LibraryLoadedState(books: allBooks);
//     } catch (e) {
//       libraryState = LibraryErrorState(message: e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Provider.value(
//       value: LibraryState,
//       floatingActionButton: FloatingActionButton(
//         onPressed: createBook,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('My library'),
//         ),
//         body: ListView.builder(
//           itemBuilder: (BuildContext context, int index) {
//             LibraryLoadingState() => const LibraryLoadingView();
//             LibraryLoadedState() =>
//                 LibraryLoadedView(state: LibraryLoadedState());
//             LibraryErrorState() => LibraryErrorView(state: LibraryErrorState());
//           },
//         ),
//       ),
//     );
//   }

//   Future<void> createBook() async {
//     final book = await showDialog<BookInfo?>(
//       context: context,
//       builder: (context) => BookCreatedWidget(
//         navigator: Navigator.of(context),
//       ),
//     );
//     if (book != null) {}
//   }
//   @override
//   Widget build(BuildContext context) {
//     final currentBooksState = LibraryState;
//
//     if (currentBooksState is LibraryLoadingState) {
//       // Error view
//       currentBooksState.LibraryLoadingState();
//       return Placeholder();
//     }
//
//     if (currentBooksState is BooksSuccessState) {
//       // Success view
//
//       return BooksListView(
//         books: currentBooksState.books,
//       );
//     }
//
//     // Loading view
//     return Placeholder();
//   }
// }


import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  LibraryState libraryState = Li);

  @override
  void initState() {
    super.initState();
    Future.microtask(() => loadData);
  }

  Future<void> loadData() async {
    final BooksDataSource booksDataSource = BooksDataSource();

    try {
      final allBooks = await booksDataSource.getAll();
      booksState = BooksSuccessState(books: allBooks);
    } catch (e) {
      booksState = BooksFailedState(message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentBooksState = booksState;

    if (currentBooksState is BooksFailedState) {
      // Error view
      currentBooksState.message;
      return Placeholder();
    }

    if (currentBooksState is BooksSuccessState) {
      // Success view

      return BooksListView(
        books: currentBooksState.books,
      );
    }

    // Loading view
    return Placeholder();
  }
}

