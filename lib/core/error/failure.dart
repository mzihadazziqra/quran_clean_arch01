/// Kelas untuk merepresentasikan opsional error dengan [message].
class Failure {
  final String message;

  Failure([this.message = "Terjadi kesalahan yang tidak terduga"]);
}

/// Merepresentasikan jenis error spesifik yang menunjukkan data tidak ditemukan di cache.
class CacheFailure extends Failure {
  CacheFailure() : super('Data tidak ditemukan di cache');
}
