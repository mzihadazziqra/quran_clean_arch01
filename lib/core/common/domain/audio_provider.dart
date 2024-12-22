import 'package:just_audio/just_audio.dart';

/// Abstraksi untuk memanipulasi pemutaran audio.
abstract class AudioProvider {
  /// Mengatur URL audio yang akan diputar.
  Future<void> setUrl(String url);

  /// Memulai pemutaran audio.
  Future<void> play();

  /// Memberhentikan pemutaran audio.
  Future<void> pause();

  /// Menghentikan dan mengatur ulang posisi pemutaran audio.
  Future<void> stop();

  /// Membebaskan sumber daya yang digunakan oleh pemutar audio.
  Future<void> dispose();

  /// Stream untuk mendengarkan perubahan status pemutar audio.
  Stream<PlayerState> get playerStateStream;
}
