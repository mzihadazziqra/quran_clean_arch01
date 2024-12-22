import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../../core/domain/audio_provider.dart';
import '../../../domain/entities/quran_surah.dart';

part 'audio_event.dart';
part 'audio_state.dart';

// Bloc untuk mengelola state audio playback
class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioProvider _audioProvider;
  Ayah? _currentAyah;

  bool _isPaused = false;
  bool _isExiting = false;

  AudioBloc({required AudioProvider audioProvider})
      : _audioProvider = audioProvider,
        super(AudioInitial()) {
    on<AudioPlayEvent>(_onPlayAudio);
    on<AudioPauseEvent>(_onPauseAudio);
    on<AudioResumeEvent>(_onResumeAudio);
    on<AudioStopEvent>(_onStopAudio);
    on<AudioFinishedEvent>(_onFinished);
    on<AudioStopAllEvent>(_onStopAllAudio);
    on<AudioStartEvent>(_onStartAudio);

    // Mendengarkan perubahan state dari audio player
    _audioProvider.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        add(AudioStopEvent());
      }
    });
  }

  void _onStartAudio(AudioStartEvent event, Emitter<AudioState> emit) async {
    _isExiting = false; // Reset _isExiting saat halaman baru dibuka
  }

  // Handler untuk memproses AudioPlayEvent
  void _onPlayAudio(AudioPlayEvent event, Emitter<AudioState> emit) async {
    if (!_isExiting) {
      if (_currentAyah != null && _currentAyah != event.ayat) {
        await _audioProvider.stop();
      }
      _isPaused = false;
      _currentAyah = event.ayat;
      try {
        emit(AudioLoading(ayat: event.ayat));
        await _audioProvider.setUrl(event.ayat.audio!.alafasy!);
        emit(AudioPlaying(ayat: event.ayat));
        await _audioProvider.play();

        // Jika ada daftar ayat, proses untuk memutar ayat berikutnya
        if (event.listAyahs != null && event.index != null) {
          int nextIndex = event.index! + 1;
          if (nextIndex < event.listAyahs!.length) {
            if (!_isPaused) {
              add(
                AudioPlayEvent(
                  ayat: event.listAyahs![nextIndex],
                  listAyahs: event.listAyahs,
                  index: nextIndex,
                ),
              );
            }
          } else {
            add(AudioFinishedEvent());
          }
        }
      } catch (e) {
        emit(AudioError(e.toString()));
      }
    }
  }

  // Handler untuk memproses AudioPauseEvent
  void _onPauseAudio(AudioPauseEvent event, Emitter<AudioState> emit) async {
    _isPaused = true;
    emit(AudioPaused(ayat: _currentAyah!));
    await _audioProvider.pause();
  }

  // Handler untuk memproses AudioResumeEvent
  void _onResumeAudio(AudioResumeEvent event, Emitter<AudioState> emit) async {
    _isPaused = false;
    emit(AudioPlaying(ayat: _currentAyah!));
    await _audioProvider.play();
  }

  // Handler untuk memproses AudioStopEvent
  void _onStopAudio(AudioStopEvent event, Emitter<AudioState> emit) async {
    emit(AudioStopped());
    await _audioProvider.stop();
    _currentAyah = null;
  }

  void _onFinished(AudioFinishedEvent event, Emitter<AudioState> emit) async {
    emit(AudioStopped());
    _currentAyah = null;
  }

  void _onStopAllAudio(
      AudioStopAllEvent event, Emitter<AudioState> emit) async {
    _isExiting = true; // Menandakan bahwa pemutaran harus dihentikan
    emit(AudioStopped());
    await _audioProvider.stop();
    _currentAyah = null;
  }

  @override
  Future<void> close() {
    _audioProvider.stop();
    return super.close();
  }
}
