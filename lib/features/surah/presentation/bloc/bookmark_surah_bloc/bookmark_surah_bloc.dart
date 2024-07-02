import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_clean_arch/core/data/database/bookmark.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/quran_surah.dart';
import '../../../domain/usecases/bookmark.dart';

part 'bookmark_surah_event.dart';
part 'bookmark_surah_state.dart';

class BookmarkSurahBloc extends Bloc<BookmarkSurahEvent, BookmarkSurahState> {
  final AddBookmark _addBookmark;
  final RemoveBookmark _removeBookmark;
  final GetBookmarks _getBookmarks;

  BookmarkSurahBloc({
    required AddBookmark addBookmark,
    required RemoveBookmark removeBookmark,
    required GetBookmarks getBookmarks,
  })  : _addBookmark = addBookmark,
        _removeBookmark = removeBookmark,
        _getBookmarks = getBookmarks,
        super(BookmarkInitial()) {
    on<BookmarkAdded>(_onBookmarkAdded);
    on<BookmarkRemoved>(_onBookmarkRemoved);
    on<BookmarksFetched>(_onBookmarksFetched);
  }

  void _onBookmarkAdded(
      BookmarkAdded event, Emitter<BookmarkSurahState> emit) async {
    emit(BookmarkLoading());
    final failureOrSuccess = await _addBookmark(BookmarkParams(
      ayat: event.ayat,
      nomorSurah: event.nomorSurah,
      numberInJuz: event.numberInJuz,
      namaSurah: event.namaSurah,
      via: event.via,
    ));

    failureOrSuccess.fold(
      (failure) => emit(BookmarkFailure(failure.message)),
      (_) => emit(BookmarkSuccess()),
    );
  }

  void _onBookmarkRemoved(
      BookmarkRemoved event, Emitter<BookmarkSurahState> emit) async {
    emit(BookmarkLoading());
    final failureOrSuccess = await _removeBookmark(event.id);

    failureOrSuccess.fold(
      (failure) => emit(BookmarkFailure(failure.message)),
      (_) => emit(BookmarkSuccess()), // After removing, fetch the updated list
    );
    add(BookmarksFetched()); // Memicu pengambilan ulang daftar bookmark setelah dihapus
  }

  void _onBookmarksFetched(
      BookmarksFetched event, Emitter<BookmarkSurahState> emit) async {
    emit(BookmarkLoading());
    final failureOrBookmarks = await _getBookmarks(NoParams());
    failureOrBookmarks.fold(
      (failure) => emit(BookmarkFailure(failure.message)),
      (bookmarks) => emit(BookmarksLoaded(bookmarks)),
    );
  }
}
