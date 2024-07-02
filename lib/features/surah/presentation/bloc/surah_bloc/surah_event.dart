part of 'surah_bloc.dart';

sealed class SurahEvent extends Equatable {
  const SurahEvent();

  @override
  List<Object> get props => [];
}

class SurahFetchAllSurahs extends SurahEvent {}
