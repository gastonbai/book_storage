import 'package:book_storage/features/library/cubit/library_cubit.dart';
import 'package:book_storage/features/library/views/library_error_view.dart';
import 'package:book_storage/features/library/views/library_loaded_view.dart';
import 'package:book_storage/features/library/views/library_loading_view.dart';
import 'package:book_storage/features/library/widgets/book_created_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/models/book_info.dart';

//основной виджет, хранит в себе книги, обновляет их, принимает, выгружает
class LibraryPage extends StatefulWidget {
  const LibraryPage({
    super.key,
    required String title,
  });

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  late final LibraryCubit libraryCubit;

  @override
  void initState() {
    libraryCubit = context.read<LibraryCubit>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои прочитанные книги'),
      ),
      body: RefreshIndicator(
        onRefresh: () => libraryCubit.init(),
        child: BlocBuilder<LibraryCubit, LibraryState>(
          builder: (context, state) {
            return switch (state) {
              LibraryLoadingState() => const LibraryLoadingView(),
              LibraryFailedState() => LibraryErrorView(state: state),
              LibraryLoadedState() => LibraryLoadedView(state: state),
            };
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createBook,
        tooltip: 'Increment',
        child: const Icon(Icons.add_chart_outlined),
      ),
    );
  }

  //вызов виджета для добавления книги, всплывающее окно
  Future<void> createBook() async {
    final book = await showDialog<BookInfo?>(
      context: context,
      builder: (context) => BookCreatedWidget(navigator: Navigator.of(context),),
    );

    if (book != null) {
      libraryCubit.addBook(book);
    }
  }
}
