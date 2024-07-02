// part of 'surah_bloc.dart';

// abstract class SurahState extends Equatable {
//   final List<QuranSurah> surah;
//   const SurahState({this.surah = const []});

//   @override
//   List<Object?> get props => [surah];
// }

// class SurahInitial extends SurahState {}

// final class SurahLoading extends SurahState {}

// final class SurahFailure extends SurahState {
//   final String error;
//   const SurahFailure(this.error);
// }

// final class SurahDisplaySuccess extends SurahState {
//   final List<QuranSurah> surahs;

//   const SurahDisplaySuccess(this.surahs);
// }

// class BookmarkSuccess extends SurahState {}

// class BookmarkFailure extends SurahState {
//   final String message;

//   const BookmarkFailure(this.message);
// }

// class BookmarksLoaded extends SurahState {
//   final List<Ayah> bookmarks;

//   const BookmarksLoaded(this.bookmarks);
// }

// class AudioLoading extends SurahState {}

// class AudioPlaying extends SurahState {
//   final Ayah? ayat;
//   const AudioPlaying({this.ayat, required super.surah});
//   @override
//   List<Object?> get props => [ayat, surah];
// }

// class AudioPaused extends SurahState {
//   final Ayah? ayat;
//   const AudioPaused({this.ayat, required super.surah});
//   @override
//   List<Object?> get props => [ayat, surah];
// }

// class AudioStopped extends SurahState {}

// class AudioError extends SurahState {
//   final String message;
//   const AudioError(this.message, {required super.surah});
//   @override
//   List<Object?> get props => [message, surah];
// }
