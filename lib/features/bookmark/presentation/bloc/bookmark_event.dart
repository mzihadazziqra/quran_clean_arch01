part of 'bookmark_bloc.dart';

/// Abstract class untuk semua event terkait bookmarks.
abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class LoadBookmarks extends BookmarkEvent {}
