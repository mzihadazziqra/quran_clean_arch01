import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data/database/bookmark.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_all_bookmark.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final GetAllBookmark _getAllBookmarks;

  BookmarkBloc({
    required GetAllBookmark getAllBookmarks,
  })  : _getAllBookmarks = getAllBookmarks,
        super(BookmarkInitial()) {
    on<LoadBookmarks>(_onLoadBookmarks);
  }

  void _onLoadBookmarks(
      LoadBookmarks event, Emitter<BookmarkState> emit) async {
    emit(BookmarkLoading());
    final res = await _getAllBookmarks(NoParams());

    res.fold(
      (l) => emit(BookmarkError(l.message)),
      (r) => emit(BookmarksLoaded(r)),
    );
  }
}
