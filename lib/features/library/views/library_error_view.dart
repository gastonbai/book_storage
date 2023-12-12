import 'package:book_storage/features/library/cubit/library_cubit.dart';
import 'package:flutter/material.dart';

class LibraryErrorView extends StatelessWidget {
  final LibraryFailedState state;

  const LibraryErrorView({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(state.message),
    );
  }
}
