import 'package:book_storage/core/extensions/widget_padding_extension.dart';
import 'package:book_storage/data/local_data_sources/book_storage/book_dara_source.dart';
import 'package:book_storage/domain/models/book_create.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/book_info.dart';
import '../book_manager.dart';
import '../cubit/library_cubit.dart';

//всплывающий виджет для добавления книги
class BookCreatedWidget extends StatefulWidget {
  final NavigatorState navigator;

  const BookCreatedWidget({
    required this.navigator,
    super.key,
  });

  @override
  State<BookCreatedWidget> createState() => _BookCreatedWidgetState();
}

class _BookCreatedWidgetState extends State<BookCreatedWidget> {
  late final BooksDataSource dataSource;
  late final LibraryCubit libraryCubit;
  late final BookCreationCubit bookCreationCubit;
  late final BookInfo bookInfo;
  late final BookCreate bookCreate;

  @override
  void initState() {
    libraryCubit = context.read();
    bookCreationCubit = BookCreationCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: BlocBuilder<BookCreationCubit, BookInfo>(
              bloc: bookCreationCubit,
              builder: (context, book) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Название').paddingOnly(top: 10),
                    TextField(
                      onChanged: bookCreationCubit.setTitle,
                    ),
                    const Text('Автор').paddingOnly(top: 10),
                    TextField(
                      onChanged: bookCreationCubit.setAuthor,
                    ),
                    const Text('Год').paddingOnly(top: 10),
                    TextField(
                      onChanged: bookCreationCubit.setYear,
                    ),
                    const Text('Издательство').paddingOnly(top: 10),
                    TextField(
                      onChanged: bookCreationCubit.setPublisher,
                    ),
                    const Text('Страниц').paddingOnly(top: 10),
                    TextField(
                      onChanged: bookCreationCubit.setPageCount,
                    ),
                    Center(
                      child: FilledButton(
                        onPressed: returnBook,
                        child: const Text('Сохранить'),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }

  //кнопка сохранить в виджете
  Future<void> returnBook() async {
    final book = bookCreationCubit.state;
    widget.navigator.pop(book);
  }
}
