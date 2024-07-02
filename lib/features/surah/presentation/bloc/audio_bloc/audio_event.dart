part of 'audio_bloc.dart';

sealed class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object> get props => [];
}

class AudioPlayEvent extends AudioEvent {
  final Ayah ayat;

  const AudioPlayEvent({required this.ayat});

  @override
  List<Object> get props => [ayat];
}

class AudioPauseEvent extends AudioEvent {}

class AudioResumeEvent extends AudioEvent {}

class AudioStopEvent extends AudioEvent {}
