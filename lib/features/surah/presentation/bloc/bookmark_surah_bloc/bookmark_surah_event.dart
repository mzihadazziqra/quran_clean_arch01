part of 'bookmark_surah_bloc.dart';

sealed class BookmarkSurahEvent extends Equatable {
  const BookmarkSurahEvent();

  @override
  List<Object> get props => [];
}

class BookmarkAdded extends BookmarkSurahEvent {
  final Ayah ayat;
  final int nomorSurah;
  final int numberInJuz;
  final String namaSurah;
  final String via;

  const BookmarkAdded({
    required this.ayat,
    required this.nomorSurah,
    required this.numberInJuz,
    required this.namaSurah,
    required this.via,
  });

  @override
  List<Object> get props => [ayat, nomorSurah, numberInJuz];
}

class BookmarkRemoved extends BookmarkSurahEvent {
  final int id;

  const BookmarkRemoved(this.id);

  @override
  List<Object> get props => [id];
}

class BookmarksFetched extends BookmarkSurahEvent {}
