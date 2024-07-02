part of 'audio_bloc.dart';

sealed class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object> get props => [];
}

class AudioInitial extends AudioState {}

class AudioLoading extends AudioState {
    final Ayah ayat; // Tambahkan properti ayat
    const AudioLoading({required this.ayat}); // Inisialisasi ayat

    @override
    List<Object> get props => [ayat]; // Sertakan ayat dalam props
}

class AudioPlaying extends AudioState {
  final Ayah ayat;

  const AudioPlaying({required this.ayat});

  @override
  List<Object> get props => [ayat];
}

class AudioPaused extends AudioState {
  final Ayah ayat;

  const AudioPaused({required this.ayat});

  @override
  List<Object> get props => [ayat];
}

class AudioStopped extends AudioState {}

class AudioError extends AudioState {
  final String message;

  const AudioError(this.message);

  @override
  List<Object> get props => [message];
}
