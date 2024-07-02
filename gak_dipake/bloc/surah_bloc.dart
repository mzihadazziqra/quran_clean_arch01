// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:just_audio/just_audio.dart';

// import '../../../../core/data/audio/just_audio_provider.dart';
// import '../../../../core/domain/audio_provider.dart';
// import '../../../../core/usecase/usecase.dart';
// import '../../domain/entities/quran_surah.dart';
// import '../../domain/usecases/bookmark.dart';
// import '../../domain/usecases/get_all_surah.dart';

// part 'surah_event.dart';
// part 'surah_state.dart';

// class SurahBloc extends Bloc<SurahEvent, SurahState> {
//   final GetAllSurah _getAllSurah;
//   final AddBookmark _addBookmark;
//   final RemoveBookmark _removeBookmark;
//   final GetBookmarks _getBookmarks;
//   AudioProvider _audioProvider = JustAudioProvider();
//   Ayah? _currentAyah;
//   SurahBloc({
//     required GetAllSurah getAllSurah,
//     required AddBookmark addBookmark,
//     required RemoveBookmark removeBookmark,
//     required GetBookmarks getBookmarks,
//   })  : _getAllSurah = getAllSurah,
//         _addBookmark = addBookmark,
//         _removeBookmark = removeBookmark,
//         _getBookmarks = getBookmarks,
//         super(SurahInitial()) {
//     on<SurahEvent>((event, emit) => emit(SurahLoading()));
//     on<SurahFetchAllSurahs>(_onFetchAllSurah);
//     on<BookmarkAdded>(_bookmarkAdded);
//     on<BookmarkRemoved>(_bookmarkRemoved);
//     on<BookmarksFetched>(_bookmarksFetched);
//     on<AudioPlayEvent>(_onPlayAudio);
//     on<AudioPauseEvent>(_onPauseAudio);
//     on<AudioResumeEvent>(_onResumeAudio);
//     on<AudioStopEvent>(_onStopAudio);
//     on<AudioResetEvent>(_onResetAudio);

//     _audioProvider.playerStateStream.listen((playerState) {
//       if (playerState.processingState == ProcessingState.completed) {
//         add(AudioStopEvent());
//       }
//     });
//   }

//   void _onFetchAllSurah(
//       SurahFetchAllSurahs event, Emitter<SurahState> emit) async {
//     final res = await _getAllSurah(NoParams());

//     res.fold(
//       (l) => emit(SurahFailure(l.message)),
//       (r) => emit(SurahDisplaySuccess(r)),
//     );
//   }

//   void _bookmarkAdded(BookmarkAdded event, Emitter<SurahState> emit) async {
//     final res = await _addBookmark(BookmarkParams(
//       ayat: event.ayat,
//       nomorSurah: event.nomorSurah,
//       numberInJuz: event.numberInJuz,
//     ));

//     res.fold(
//       (l) => emit(BookmarkFailure(l.message)),
//       (r) => emit(BookmarkSuccess()),
//     );
//   }

//   void _bookmarkRemoved(BookmarkRemoved event, Emitter<SurahState> emit) async {
//     final res = await _removeBookmark(event.id);

//     res.fold(
//       (l) => emit(BookmarkFailure(l.message)),
//       (r) => emit(BookmarkSuccess()),
//     );
//   }

//   void _bookmarksFetched(
//       BookmarksFetched event, Emitter<SurahState> emit) async {
//     final res = await _getBookmarks(NoParams());

//     res.fold(
//       (l) => emit(BookmarkFailure(l.message)),
//       (r) => emit(BookmarksLoaded(r)),
//     );
//   }

//   void _onPlayAudio(AudioPlayEvent event, Emitter<SurahState> emit) async {
//     if (_currentAyah != null && _currentAyah != event.ayat) {
//       await _audioProvider.stop();
//     }
//     _currentAyah = event.ayat;
//     try {
//       emit(AudioLoading());
//       await _audioProvider.setUrl(event.ayat.audio!.alafasy!);
//       emit(AudioPlaying(ayat: event.ayat, surah: state.surah));
//       await _audioProvider.play();
//     } catch (e) {
//       emit(AudioError(e.toString(), surah: state.surah));
//     }
//   }

//   void _onPauseAudio(AudioPauseEvent event, Emitter<SurahState> emit) async {
//     emit(AudioPaused(ayat: _currentAyah, surah: state.surah));
//     await _audioProvider.pause();
//   }

//   void _onResumeAudio(AudioResumeEvent event, Emitter<SurahState> emit) async {
//     emit(AudioPlaying(ayat: _currentAyah, surah: state.surah));
//     await _audioProvider.play();
//   }

//   void _onStopAudio(AudioStopEvent event, Emitter<SurahState> emit) async {
//     emit(AudioStopped());
//     await _audioProvider.stop();
//     _currentAyah = null;
//   }

//   void _onResetAudio(AudioResetEvent event, Emitter<SurahState> emit) async {
//     await _audioProvider.stop();
//     await _audioProvider.dispose();
//     _audioProvider = JustAudioProvider();
//     emit(AudioStopped());
//     _currentAyah = null;
//   }

//   @override
//   Future<void> close() {
//     _audioProvider.stop();
//     return super.close();
//   }
// }
