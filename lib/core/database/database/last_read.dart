import 'package:equatable/equatable.dart';

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

  factory LastRead.fromMap(Map<String, dynamic> map) {
    return LastRead(
      id: map['id'],
      nomorSurah: map['nomorSurah'],
      nomorAyat: map['nomorAyat'],
      namaSurah: map['namaSurah'],
      via: map['via'],
    );
  }

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
