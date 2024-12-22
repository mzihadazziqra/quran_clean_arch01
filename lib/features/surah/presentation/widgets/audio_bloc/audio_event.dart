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
  final List<Ayah>? listAyahs;
  final int? index;

  const AudioPlayEvent({
    required this.ayat,
    this.listAyahs,
    this.index,
  });

  @override
  List<Object> get props => [ayat, listAyahs ?? [], index ?? -1];
}

// Event untuk menjeda pemutaran audio
class AudioPauseEvent extends AudioEvent {}

// Event untuk melanjutkan pemutaran audio yang telah dijeda
class AudioResumeEvent extends AudioEvent {}

// Event untuk menghentikan pemutaran audio
class AudioStopEvent extends AudioEvent {}

class AudioFinishedEvent extends AudioEvent {}

class AudioStopAllEvent extends AudioEvent {}

class AudioStartEvent extends AudioEvent {}
