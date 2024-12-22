part of 'detail_surah_bloc.dart';

// Kelas abstrak untuk status-status terkait dengan detail surah Al-Quran
sealed class DetailSurahState extends Equatable {
  const DetailSurahState();

  @override
  List<Object> get props => [];
}

// Status awal saat aplikasi memulai pencarian detail surah
final class DetailSurahInitial extends DetailSurahState {}

// Status ketika sedang dalam proses memuat detail surah
class DetailSurahLoading extends DetailSurahState {}

// Status ketika berhasil memuat detail surah
class DetailSurahSuccess extends DetailSurahState {
  final QuranSurah surah;

  const DetailSurahSuccess(this.surah);

  @override
  List<Object> get props => [surah];
}

// Status ketika terjadi kesalahan dalam memuat detail surah
class DetailSurahError extends DetailSurahState {
  final String message;

  const DetailSurahError(this.message);

  @override
  List<Object> get props => [message];
}

// Status ketika berhasil menyimpan data terakhir yang dibaca
class InsertLastReadSuccess extends DetailSurahState {}
