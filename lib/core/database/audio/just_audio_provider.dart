import 'package:just_audio/just_audio.dart';
import '../../domain/audio_provider.dart';

/// Implementasi dari AudioProvider menggunakan Just Audio.
class JustAudioProvider implements AudioProvider {
  final AudioPlayer _audioPlayer = AudioPlayer();

  /// Mengatur URL audio yang akan diputar.
  @override
  Future<void> setUrl(String url) => _audioPlayer.setUrl(url);

  /// Memulai pemutaran audio.
  @override
  Future<void> play() => _audioPlayer.play();

  /// Memberhentikan pemutaran audio.
  @override
  Future<void> pause() => _audioPlayer.pause();

  /// Menghentikan pemutaran audio dan mengatur posisi ke awal.
  @override
  Future<void> stop() => _audioPlayer.stop();

  /// Stream untuk mendengarkan perubahan status pemutaran audio.
  @override
  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;

  /// Membebaskan sumber daya yang digunakan oleh AudioPlayer.
  @override
  Future<void> dispose() => _audioPlayer.dispose();
}
