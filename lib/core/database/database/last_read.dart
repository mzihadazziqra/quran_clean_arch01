import 'package:equatable/equatable.dart';

/// Kelas untuk merepresentasikan data terakhir yang dibaca dalam Al-Quran.
class LastRead extends Equatable {
  final int? id;
  final int nomorSurah;
  final int nomorAyat;
  final String namaSurah;
  final String via;

  const LastRead({
    this.id,
    required this.nomorSurah,
    required this.nomorAyat,
    required this.namaSurah,
    required this.via,
  });

  /// Membuat instance LastRead dari Map.
  factory LastRead.fromMap(Map<String, dynamic> map) {
    return LastRead(
      id: map['id'],
      nomorSurah: map['nomorSurah'],
      nomorAyat: map['nomorAyat'],
      namaSurah: map['namaSurah'],
      via: map['via'],
    );
  }

  /// Mengubah instance LastRead menjadi Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomorSurah': nomorSurah,
      'nomorAyat': nomorAyat,
      'namaSurah': namaSurah,
      'via': via,
    };
  }

  @override
  List<Object?> get props => [id, nomorSurah, nomorAyat, namaSurah, via];
}
