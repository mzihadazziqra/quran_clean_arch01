import 'package:just_audio/just_audio.dart';
import '../../domain/audio_provider.dart';

class JustAudioProvider implements AudioProvider {
  final AudioPlayer _audioPlayer = AudioPlayer();
  @override
  Future<void> setUrl(String url) => _audioPlayer.setUrl(url);

  @override
  Future<void> play() => _audioPlayer.play();

  @override
  Future<void> pause() => _audioPlayer.pause();

  @override
  Future<void> stop() => _audioPlayer.stop();

  @override
  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;

  @override
  Future<void> dispose() => _audioPlayer.dispose();
}
