import 'package:equatable/equatable.dart';

class QuranSurah extends Equatable {
  final String? revelation;
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;
  final String? tempatTurun;
  final String? arti;
  final AudioFull? audioFull;
  final List<Ayah> ayahs;
  final Surah? nextSurah;
  final Surah? prevSurah;

  const QuranSurah({
    required this.revelation,
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.audioFull,
    required this.ayahs,
    required this.nextSurah,
    required this.prevSurah,
  });

  @override
  List<Object?> get props => [
        revelation,
        nomor,
        nama,
        namaLatin,
        jumlahAyat,
        tempatTurun,
        arti,
        audioFull,
        ayahs,
        nextSurah,
        prevSurah,
      ];
}

class AudioFull extends Equatable {
  final String? abdullahAlJuhany;
  final String? abdulMuhsinAlQasim;
  final String? abdurrahmanAsSudais;
  final String? ibrahimAlDossari;
  final String? misyariRasyidAlAfasi;
  const AudioFull({
    required this.abdullahAlJuhany,
    required this.abdulMuhsinAlQasim,
    required this.abdurrahmanAsSudais,
    required this.ibrahimAlDossari,
    required this.misyariRasyidAlAfasi,
  });

  @override
  List<Object?> get props => [
        abdullahAlJuhany,
        abdulMuhsinAlQasim,
        abdurrahmanAsSudais,
        ibrahimAlDossari,
        misyariRasyidAlAfasi,
      ];

  static fromJson(json) {}

  toJson() {}
}

class Ayah extends Equatable {
  final int? id;
  final Number? number;
  final String? arab;
  final String? translation;
  final Audio? audio;
  final Image? image;
  final Tafsir? tafsir;
  final Meta? meta;
  final String? teksLatin;

  const Ayah({
    required this.id,
    required this.number,
    required this.arab,
    required this.translation,
    required this.audio,
    required this.image,
    required this.tafsir,
    required this.meta,
    required this.teksLatin,
  });

  @override
  List<Object?> get props => [
        number,
        arab,
        translation,
        audio,
        image,
        tafsir,
        meta,
        teksLatin,
      ];

  toJson() {}
}

class Audio extends Equatable {
  final String? alafasy;
  final String? ahmedajamy;
  final String? husarymujawwad;
  final String? minshawi;
  final String? muhammadayyoub;
  final String? muhammadjibreel;

  const Audio({
    required this.alafasy,
    required this.ahmedajamy,
    required this.husarymujawwad,
    required this.minshawi,
    required this.muhammadayyoub,
    required this.muhammadjibreel,
  });

  @override
  List<Object?> get props => [
        alafasy,
        ahmedajamy,
        husarymujawwad,
        minshawi,
        muhammadayyoub,
        muhammadjibreel,
      ];

  toJson() {}
}

class Image extends Equatable {
  final String? primary;
  final String? secondary;

  const Image({
    required this.primary,
    required this.secondary,
  });

  @override
  List<Object?> get props => [
        primary,
        secondary,
      ];

  toJson() {}
}

class Meta extends Equatable {
  final int? juz;
  final int? page;
  final int? manzil;
  final int? ruku;
  final int? hizbQuarter;
  final Sajda? sajda;

  const Meta({
    required this.juz,
    required this.page,
    required this.manzil,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  @override
  List<Object?> get props => [
        juz,
        page,
        manzil,
        ruku,
        hizbQuarter,
        sajda,
      ];

  toJson() {}
}

class Sajda extends Equatable {
  final bool? recommended;
  final bool? obligatory;

  const Sajda({
    required this.recommended,
    required this.obligatory,
  });

  @override
  List<Object?> get props => [
        recommended,
        obligatory,
      ];

  toJson() {}
}

class Number extends Equatable {
  final int? inQuran;
  final int? inSurah;

  const Number({
    required this.inQuran,
    required this.inSurah,
  });

  @override
  List<Object?> get props => [
        inQuran,
        inSurah,
      ];

  toJson() {}
}

class Tafsir extends Equatable {
  final Kemenag? kemenag;
  final String? quraish;
  final String? jalalayn;

  const Tafsir({
    required this.kemenag,
    required this.quraish,
    required this.jalalayn,
  });

  @override
  List<Object?> get props => [
        kemenag,
        quraish,
        jalalayn,
      ];

  toJson() {}
}

class Kemenag extends Equatable {
  final String? short;
  final String? long;

  const Kemenag({
    required this.short,
    required this.long,
  });

  @override
  List<Object?> get props => [
        short,
        long,
      ];

  toJson() {}
}

class Surah extends Equatable {
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;

  const Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
  });

  @override
  List<Object?> get props => [
        nomor,
        nama,
        namaLatin,
        jumlahAyat,
      ];

  toJson() {}
}
