// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:quran_clean_arch/core/data/audio/just_audio_provider.dart';
// import 'package:quran_clean_arch/core/domain/audio_provider.dart';
// import 'package:quran_clean_arch/features/surah/domain/entities/quran_surah.dart';

// part 'audio_player_event.dart';
// part 'audio_player_state.dart';

// class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
//   AudioProvider _audioProvider;
//   // final AudioPlayer _audioPlayer = AudioPlayer();
//   Ayah? _currentAyah;

//   AudioPlayerBloc(
//     this._audioProvider,
//   ) : super(AudioStopped()) {
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

//   void _onPlayAudio(
//       AudioPlayEvent event, Emitter<AudioPlayerState> emit) async {
//     // print('Play audio triggered');
//     if (_currentAyah != null && _currentAyah != event.ayat) {
//       await _audioProvider.stop();
//     }
//     _currentAyah = event.ayat;
//     try {
//       emit(AudioLoading()); // Menambahkan state loading sebelum pemutaran
//       await _audioProvider.setUrl(event.ayat.audio!.alafasy!);
//       emit(AudioPlaying(ayat: event.ayat));
//       await _audioProvider.play();
//     } catch (e) {
//       emit(AudioError(e.toString()));
//     }
//   }

//   void _onPauseAudio(
//       AudioPauseEvent event, Emitter<AudioPlayerState> emit) async {
//     emit(AudioPaused(ayat: _currentAyah));
//     await _audioProvider.pause();
//   }

//   void _onResumeAudio(
//       AudioResumeEvent event, Emitter<AudioPlayerState> emit) async {
//     emit(AudioPlaying(ayat: _currentAyah));
//     await _audioProvider.play();
//   }

//   void _onStopAudio(
//       AudioStopEvent event, Emitter<AudioPlayerState> emit) async {
//     emit(AudioStopped());
//     await _audioProvider.stop();
//     _currentAyah = null;
//   }

//   void _onResetAudio(
//       AudioResetEvent event, Emitter<AudioPlayerState> emit) async {
//     await _audioProvider.stop();
//     await _audioProvider.dispose();
//     _audioProvider = JustAudioProvider(); // Hapus AudioPlayer()
//     emit(AudioStopped());
//     _currentAyah = null;
//   }

//   @override
//   Future<void> close() {
//     // _audioProvider.dispose();
//     _audioProvider.stop();
//     return super.close();
//   }
// }
