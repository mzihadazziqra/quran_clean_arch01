import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/database/database/bookmark.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/quran_surah.dart';
import '../../../domain/usecases/bookmark.dart';

part 'bookmark_surah_event.dart';
part 'bookmark_surah_state.dart';

// Bloc untuk mengelola state terkait dengan bookmark surah
class BookmarkSurahBloc extends Bloc<BookmarkSurahEvent, BookmarkSurahState> {
  final AddBookmark _addBookmark;
  final RemoveBookmark _removeBookmark;
  final GetBookmarks _getBookmarks;

  // Konstruktor untuk menginisialisasi use cases yang diperlukan dan initial state
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

  // Handler untuk event BookmarkAdded
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

    // Handle hasil dari addBookmark
    failureOrSuccess.fold(
      (failure) => emit(BookmarkFailure(failure.message)),
      (_) => emit(BookmarkSuccess()),
    );
  }

  // Handler untuk event BookmarkRemoved
  void _onBookmarkRemoved(
      BookmarkRemoved event, Emitter<BookmarkSurahState> emit) async {
    emit(BookmarkLoading());
    final failureOrSuccess = await _removeBookmark(event.id);

    // Handle hasil dari removeBookmark
    failureOrSuccess.fold(
      (failure) => emit(BookmarkFailure(failure.message)),
      (_) => emit(BookmarkSuccess()),
    );
    add(BookmarksFetched());
  }

  // Handler untuk event BookmarksFetched
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
