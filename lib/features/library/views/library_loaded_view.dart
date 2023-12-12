import 'package:book_storage/features/library/cubit/library_cubit.dart';
import 'package:book_storage/features/library/widgets/short_book_info.dart';
import 'package:flutter/cupertino.dart';

class LibraryLoadedView extends StatelessWidget {
  final LibraryLoadedState state;

  const LibraryLoadedView({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (state.books.isEmpty) {}

    return ListView.builder(
      itemCount: state.books.length,
      itemBuilder: (context, index) {
        return BookShortInfoWidget(
          bookInfo: state.books[index],
        );
      },
    );
  }
}
