part of 'bookmark_surah_bloc.dart';

// Kelas abstrak untuk event-event terkait dengan manajemen bookmark surah
sealed class BookmarkSurahEvent extends Equatable {
  const BookmarkSurahEvent();

  @override
  List<Object> get props => [];
}

// Event ketika sebuah bookmark ditambahkan
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

// Event ketika sebuah bookmark dihapus
class BookmarkRemoved extends BookmarkSurahEvent {
  final int id;

  const BookmarkRemoved(this.id);

  @override
  List<Object> get props => [id];
}

// Event untuk mengambil daftar bookmarks yang tersimpan
class BookmarksFetched extends BookmarkSurahEvent {}
