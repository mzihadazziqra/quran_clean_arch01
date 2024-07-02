import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../core/domain/audio_provider.dart';
import '../../../domain/entities/quran_surah.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioProvider _audioProvider;
  Ayah? _currentAyah;

  AudioBloc({required AudioProvider audioProvider})
      : _audioProvider = audioProvider,
        super(AudioInitial()) {
    on<AudioPlayEvent>(_onPlayAudio);
    on<AudioPauseEvent>(_onPauseAudio);
    on<AudioResumeEvent>(_onResumeAudio);
    on<AudioStopEvent>(_onStopAudio);

    _audioProvider.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        add(AudioStopEvent());
      }
    });
  }

  void _onPlayAudio(AudioPlayEvent event, Emitter<AudioState> emit) async {
    if (_currentAyah != null && _currentAyah != event.ayat) {
      await _audioProvider.stop();
    }
    _currentAyah = event.ayat;
    try {
      emit(AudioLoading(ayat: event.ayat));
      await _audioProvider.setUrl(event.ayat.audio!.alafasy!);
      emit(AudioPlaying(ayat: event.ayat));
      await _audioProvider.play();
    } catch (e) {
      emit(AudioError(e.toString()));
    }
  }

  void _onPauseAudio(AudioPauseEvent event, Emitter<AudioState> emit) async {
    emit(AudioPaused(ayat: _currentAyah!));
    await _audioProvider.pause();
  }

  void _onResumeAudio(AudioResumeEvent event, Emitter<AudioState> emit) async {
    emit(AudioPlaying(ayat: _currentAyah!));
    await _audioProvider.play();
  }

  void _onStopAudio(AudioStopEvent event, Emitter<AudioState> emit) async {
    emit(AudioStopped());
    await _audioProvider.stop();
    _currentAyah = null;
  }

  @override
  Future<void> close() {
    // _audioProvider.dispose();
    _audioProvider.stop();
    return super.close();
  }
}
