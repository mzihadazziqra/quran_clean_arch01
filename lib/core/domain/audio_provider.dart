import 'package:just_audio/just_audio.dart';

abstract class AudioProvider {
  Future<void> setUrl(String url);
  Future<void> play();
  Future<void> pause();
  Future<void> stop();
  Future<void> dispose();
  Stream<PlayerState> get playerStateStream;
}
