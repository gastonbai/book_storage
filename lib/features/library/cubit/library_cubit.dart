import 'package:flutter_bloc/flutter_bloc.dart';

import 'library_state.dart';


class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(LibraryLoadingState()) {
  }
}
