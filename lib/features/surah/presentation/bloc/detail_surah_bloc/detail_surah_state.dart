part of 'detail_surah_bloc.dart';

sealed class DetailSurahState extends Equatable {
  const DetailSurahState();

  @override
  List<Object> get props => [];
}

final class DetailSurahInitial extends DetailSurahState {}

class DetailSurahLoading extends DetailSurahState {}

class DetailSurahSuccess extends DetailSurahState {
  final QuranSurah surah;
  const DetailSurahSuccess(this.surah);

  @override
  List<Object> get props => [surah];
}

class DetailSurahError extends DetailSurahState {
  final String message;

  const DetailSurahError(this.message);

  @override
  List<Object> get props => [message];
}

class InsertLastReadSuccess extends DetailSurahState {}
