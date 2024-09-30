part of 'audio_bloc.dart';

// Kelas abstrak untuk event-event yang terkait dengan audio
sealed class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object> get props => [];
}

// Event untuk memulai pemutaran audio pada sebuah ayat
class AudioPlayEvent extends AudioEvent {
  final Ayah ayat;

  const AudioPlayEvent({required this.ayat});

  @override
  List<Object> get props => [ayat];
}

// Event untuk menjeda pemutaran audio
class AudioPauseEvent extends AudioEvent {}

// Event untuk melanjutkan pemutaran audio yang telah dijeda
class AudioResumeEvent extends AudioEvent {}

// Event untuk menghentikan pemutaran audio
class AudioStopEvent extends AudioEvent {}
