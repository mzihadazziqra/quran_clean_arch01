part of 'audio_bloc.dart';

// Kelas abstrak untuk state-state terkait dengan audio
sealed class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object> get props => [];
}

// State awal ketika Bloc pertama kali dibuat
class AudioInitial extends AudioState {}

// State ketika sedang melakukan loading untuk pemutaran audio
class AudioLoading extends AudioState {
  final Ayah ayat;
  const AudioLoading({required this.ayat});

  @override
  List<Object> get props => [ayat];
}

// State ketika sedang dalam proses pemutaran audio
class AudioPlaying extends AudioState {
  final Ayah ayat;

  const AudioPlaying({required this.ayat});

  @override
  List<Object> get props => [ayat];
}

// State ketika audio telah dijeda
class AudioPaused extends AudioState {
  final Ayah ayat;

  const AudioPaused({required this.ayat});
  @override
  List<Object> get props => [ayat];
}

// State ketika audio telah dihentikan
class AudioStopped extends AudioState {}

// State ketika terjadi error pada pemutaran audio
class AudioError extends AudioState {
  final String message;

  const AudioError(this.message);

  @override
  List<Object> get props => [message];
}
