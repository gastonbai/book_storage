import 'package:book_storage/domain/models/book_info.dart';
import 'package:book_storage/features/library/book_manager.dart';
import 'package:flutter/material.dart';

class BookCreatedWidget extends StatelessWidget{
  final NavigatorState navigator;
  final BookCreationCubit bookCreationCubit = BookCreationCubit();

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Название'),
          TextField(onChanged: bookCreationCubit.setTitle),
          const Text('Автор'),
          TextField(onChanged: bookCreationCubit.setAuthor),
          const Text('Год'),
          TextField(onChanged: bookCreationCubit.setYear),
          const Text('Издательство'),
          TextField(onChanged: bookCreationCubit.setPublisher),
          const Text('Страниц'),
          TextField(onChanged: bookCreationCubit.setPageCount),
          Center(
            child: FilledButton(
                onPressed: cancel,
                child: const Text('Сохранить'),
            ),
          )
        ],
      ),
    ),
  );
  }

  Future<void> cancel() async{
    final book = BookInfo();
    navigator.pop(await book);
  }

}