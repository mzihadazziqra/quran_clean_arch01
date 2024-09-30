part of 'bookmark_surah_bloc.dart';

// Kelas abstrak untuk state-state terkait dengan manajemen bookmark surah
sealed class BookmarkSurahState extends Equatable {
  const BookmarkSurahState();

  @override
  List<Object> get props => [];
}

// State awal saat Bloc BookmarkSurahBloc diinisialisasi
final class BookmarkInitial extends BookmarkSurahState {}

// State saat sedang dalam proses loading
class BookmarkLoading extends BookmarkSurahState {}

// State ketika operasi bookmark berhasil dilakukan
class BookmarkSuccess extends BookmarkSurahState {}

// State ketika terjadi kegagalan dalam operasi bookmark
class BookmarkFailure extends BookmarkSurahState {
  final String message;

  const BookmarkFailure(this.message);

  @override
  List<Object> get props => [message];
}

// State ketika daftar bookmarks berhasil dimuat
class BookmarksLoaded extends BookmarkSurahState {
  final List<Bookmark> bookmarks;

  const BookmarksLoaded(this.bookmarks);

  @override
  List<Object> get props => [bookmarks];
}
