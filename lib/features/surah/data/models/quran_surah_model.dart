import 'package:quran_clean_arch/features/surah/domain/entities/quran_surah.dart';

class QuranSurahModel extends QuranSurah {
  const QuranSurahModel({
    required super.revelation,
    required super.nomor,
    required super.nama,
    required super.namaLatin,
    required super.jumlahAyat,
    required super.tempatTurun,
    required super.arti,
    required super.audioFull,
    required super.ayahs,
    required super.nextSurah,
    required super.prevSurah,
  });

  factory QuranSurahModel.fromJson(Map<String, dynamic> json) {
    return QuranSurahModel(
      revelation: json["revelation"],
      nomor: json["nomor"],
      nama: json["nama"],
      namaLatin: json["namaLatin"],
      jumlahAyat: json["jumlahAyat"],
      tempatTurun: json["tempatTurun"],
      arti: json["arti"],
      audioFull: json["audioFull"] != null
          ? AudioFullModel.fromJson(json["audioFull"])
          : null,
      ayahs: json["ayahs"] == null
          ? []
          : List<AyahModel>.from(
              json["ayahs"]!.map((x) => AyahModel.fromJson(x))),
      nextSurah: json["nextSurah"] is bool || json["nextSurah"] == null
          ? null
          : SurahModel.fromJson(json["nextSurah"]),
      prevSurah: json["prevSurah"] is bool || json["prevSurah"] == null
          ? null
          : SurahModel.fromJson(json["prevSurah"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "revelation": revelation,
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "audioFull": audioFull?.toJson(),
        "ayahs": ayahs.map((x) => x.toJson()).toList(),
        "nextSurah": nextSurah?.toJson(),
        "prevSurah": prevSurah?.toJson(),
      };

  static List<QuranSurahModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => QuranSurahModel.fromJson(json)).toList();
  }
}

class AudioFullModel extends AudioFull {
  const AudioFullModel({
    required super.abdullahAlJuhany,
    required super.abdulMuhsinAlQasim,
    required super.abdurrahmanAsSudais,
    required super.ibrahimAlDossari,
    required super.misyariRasyidAlAfasi,
  });

  factory AudioFullModel.fromJson(Map<String, dynamic> json) {
    return AudioFullModel(
      abdullahAlJuhany: json["Abdullah-Al-Juhany"],
      abdulMuhsinAlQasim: json["Abdul-Muhsin-Al-Qasim"],
      abdurrahmanAsSudais: json["Abdurrahman-as-Sudais"],
      ibrahimAlDossari: json["Ibrahim-Al-Dossari"],
      misyariRasyidAlAfasi: json["Misyari-Rasyid-Al-Afasi"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "Abdullah-Al-Juhany": abdullahAlJuhany,
        "Abdul-Muhsin-Al-Qasim": abdulMuhsinAlQasim,
        "Abdurrahman-as-Sudais": abdurrahmanAsSudais,
        "Ibrahim-Al-Dossari": ibrahimAlDossari,
        "Misyari-Rasyid-Al-Afasi": misyariRasyidAlAfasi,
      };
}

class AyahModel extends Ayah {
  const AyahModel({
    required super.id,
    required super.number,
    required super.arab,
    required super.translation,
    required super.audio,
    required super.image,
    required super.tafsir,
    required super.meta,
    required super.teksLatin,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      id: json["number"]["inQuran"],
      number:
          json["number"] == null ? null : NumberModel.fromJson(json["number"]),
      arab: json["arab"],
      translation: json["translation"],
      audio: json["audio"] == null ? null : AudioModel.fromJson(json["audio"]),
      image: json["image"] == null ? null : ImageModel.fromJson(json["image"]),
      tafsir:
          json["tafsir"] == null ? null : TafsirModel.fromJson(json["tafsir"]),
      meta: json["meta"] == null ? null : MetaModel.fromJson(json["meta"]),
      teksLatin: json["teksLatin"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "number": number?.toJson(),
        "arab": arab,
        "translation": translation,
        "audio": audio?.toJson(),
        "image": image?.toJson(),
        "tafsir": tafsir?.toJson(),
        "meta": meta?.toJson(),
        "teksLatin": teksLatin,
      };
}

class AudioModel extends Audio {
  const AudioModel({
    required super.alafasy,
    required super.ahmedajamy,
    required super.husarymujawwad,
    required super.minshawi,
    required super.muhammadayyoub,
    required super.muhammadjibreel,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      alafasy: json["alafasy"],
      ahmedajamy: json["ahmedajamy"],
      husarymujawwad: json["husarymujawwad"],
      minshawi: json["minshawi"],
      muhammadayyoub: json["muhammadayyoub"],
      muhammadjibreel: json["muhammadjibreel"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "alafasy": alafasy,
        "ahmedajamy": ahmedajamy,
        "husarymujawwad": husarymujawwad,
        "minshawi": minshawi,
        "muhammadayyoub": muhammadayyoub,
        "muhammadjibreel": muhammadjibreel,
      };
}

class ImageModel extends Image {
  const ImageModel({
    required super.primary,
    required super.secondary,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      primary: json["primary"],
      secondary: json["secondary"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary,
      };
}

class MetaModel extends Meta {
  const MetaModel({
    required super.juz,
    required super.page,
    required super.manzil,
    required super.ruku,
    required super.hizbQuarter,
    required super.sajda,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      juz: json["juz"],
      page: json["page"],
      manzil: json["manzil"],
      ruku: json["ruku"],
      hizbQuarter: json["hizbQuarter"],
      sajda: json["sajda"] == null ? null : SajdaModel.fromJson(json["sajda"]),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "juz": juz,
        "page": page,
        "manzil": manzil,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda?.toJson(),
      };
}

class SajdaModel extends Sajda {
  const SajdaModel({
    required super.recommended,
    required super.obligatory,
  });

  factory SajdaModel.fromJson(Map<String, dynamic> json) {
    return SajdaModel(
      recommended: json["recommended"],
      obligatory: json["obligatory"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "recommended": recommended,
        "obligatory": obligatory,
      };
}

class NumberModel extends Number {
  const NumberModel({
    required super.inQuran,
    required super.inSurah,
  });

  factory NumberModel.fromJson(Map<String, dynamic> json) {
    return NumberModel(
      inQuran: json["inQuran"],
      inSurah: json["inSurah"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "inQuran": inQuran,
        "inSurah": inSurah,
      };
}

class TafsirModel extends Tafsir {
  const TafsirModel({
    required super.kemenag,
    required super.quraish,
    required super.jalalayn,
  });

  factory TafsirModel.fromJson(Map<String, dynamic> json) {
    return TafsirModel(
      kemenag: json["kemenag"] == null
          ? null
          : KemenagModel.fromJson(json["kemenag"]),
      quraish: json["quraish"],
      jalalayn: json["jalalayn"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "kemenag": kemenag?.toJson(),
        "quraish": quraish,
        "jalalayn": jalalayn,
      };
}

class KemenagModel extends Kemenag {
  const KemenagModel({
    required super.short,
    required super.long,
  });

  factory KemenagModel.fromJson(Map<String, dynamic> json) {
    return KemenagModel(
      short: json["short"],
      long: json["long"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
      };
}

class SurahModel extends Surah {
  const SurahModel({
    required super.nomor,
    required super.nama,
    required super.namaLatin,
    required super.jumlahAyat,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      nomor: json["nomor"],
      nama: json["nama"],
      namaLatin: json["namaLatin"],
      jumlahAyat: json["jumlahAyat"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
      };
}
