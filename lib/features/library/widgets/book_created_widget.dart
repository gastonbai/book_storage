import 'package:book_storage/domain/models/book_info.dart';
import 'package:book_storage/features/library/book_manager.dart';
import 'package:flutter/material.dart';

class BookCreatedWidget extends StatelessWidget{

  get navigator => null;

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
          const Text('Автор'),
          const Text('Год'),
          const Text('Издательство'),
          const Text('Страниц'),
          Center(
            child: FilledButton(
                onPressed: () {BookCreatedWidget().toStringDeep();},
                child: const Text('Сохранить'),
            ),
          )
        ],
      ),
    ),
  );
  }

}