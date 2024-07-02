part of 'surah_bloc.dart';

sealed class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

final class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahFailure extends SurahState {
  final String message;

  const SurahFailure(this.message);

  @override
  List<Object> get props => [message];
}

class SurahDisplaySuccess extends SurahState {
  final List<QuranSurah> surahs;

  const SurahDisplaySuccess(this.surahs);

  @override
  List<Object> get props => [surahs];
}
