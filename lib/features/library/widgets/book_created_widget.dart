import 'package:book_storage/core/extensions/widget_padding_extension.dart';

import 'package:book_storage/domain/models/book_info.dart';
import 'package:book_storage/features/library/book_manager.dart';

import 'package:flutter/material.dart';

import '../cubit/library_cubit.dart';

class BookCreatedWidget extends StatelessWidget {
  final NavigatorState navigator;
  final BookCreationCubit bookCreationCubit = BookCreationCubit();
  late final LibraryCubit libraryCubit;

  BookCreatedWidget({
    required this.navigator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Название').paddingOnly(top: 10),
              TextField(onChanged: bookCreationCubit.setTitle),
              const Text('Автор').paddingOnly(top: 10),
              TextField(onChanged: bookCreationCubit.setAuthor),
              const Text('Год').paddingOnly(top: 10),
              TextField(onChanged: bookCreationCubit.setYear),
              const Text('Издательство').paddingOnly(top: 10),
              TextField(onChanged: bookCreationCubit.setPublisher),
              const Text('Страниц').paddingOnly(top: 10),
              TextField(onChanged: bookCreationCubit.setPageCount),
              Center(
                child: FilledButton(
                  onPressed: () => returnBook(),
                  child: const Text('Сохранить'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> returnBook() async {
    final book = libraryCubit.dataSource.getAll();
    navigator.pop(book);
  }
}
