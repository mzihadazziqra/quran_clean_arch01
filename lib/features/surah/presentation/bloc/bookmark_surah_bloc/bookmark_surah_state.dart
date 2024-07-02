part of 'bookmark_surah_bloc.dart';

sealed class BookmarkSurahState extends Equatable {
  const BookmarkSurahState();

  @override
  List<Object> get props => [];
}

final class BookmarkInitial extends BookmarkSurahState {}

class BookmarkLoading extends BookmarkSurahState {}

class BookmarkSuccess extends BookmarkSurahState {}

class BookmarkFailure extends BookmarkSurahState {
  final String message;

  const BookmarkFailure(this.message);

  @override
  List<Object> get props => [message];
}

class BookmarksLoaded extends BookmarkSurahState {
  final List<Bookmark> bookmarks;

  const BookmarksLoaded(this.bookmarks);

  @override
  List<Object> get props => [bookmarks];
}
