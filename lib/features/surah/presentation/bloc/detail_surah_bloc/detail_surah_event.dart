part of 'detail_surah_bloc.dart';

// Kelas abstrak untuk event-event terkait dengan detail surah Al-Quran
sealed class DetailSurahEvent extends Equatable {
  const DetailSurahEvent();

  @override
  List<Object> get props => [];
}

// Event untuk mengambil detail surah berdasarkan ID surah
class DetailSurahFetchById extends DetailSurahEvent {
  final int nomorSurah;

  const DetailSurahFetchById(this.nomorSurah);

  @override
  List<Object> get props => [nomorSurah];
}

// Event untuk mendapatkan data terakhir yang dibaca
class GetLastReadEvent extends DetailSurahEvent {}

// Event untuk menyimpan data terakhir yang dibaca
class InsertLastReadEvent extends DetailSurahEvent {
  final int nomorSurah;
  final int nomorAyat;
  final String namaSurah;
  final String via;

  const InsertLastReadEvent({
    required this.nomorSurah,
    required this.nomorAyat,
    required this.namaSurah,
    required this.via,
  });

  @override
  List<Object> get props => [
        nomorSurah,
        nomorAyat,
        namaSurah,
        via,
      ];
}
