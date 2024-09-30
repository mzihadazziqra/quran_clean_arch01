part of 'surah_bloc.dart';

// State class untuk mengelola state terkait dengan daftar surah Al-Quran
sealed class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

// State awal ketika SurahBloc pertama kali dibuat
final class SurahInitial extends SurahState {}

// State ketika sedang dalam proses memuat data
class SurahLoading extends SurahState {}

// State ketika terjadi kegagalan dalam memuat atau memproses data
class SurahFailure extends SurahState {
  final String message;

  const SurahFailure(this.message);

  @override
  List<Object> get props => [message];
}

// State ketika berhasil mendapatkan dan menampilkan data surah
class SurahDisplaySuccess extends SurahState {
  final List<QuranSurah> surahs;

  const SurahDisplaySuccess(this.surahs);
  @override
  List<Object> get props => [surahs];
}
