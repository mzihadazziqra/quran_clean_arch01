import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/error/exceptions.dart';
import '../models/quran_surah_model.dart';

// Abstract class untuk di extends oleh class implementation
abstract class SurahLocalDataSource {
  /// Mengambil seluruh data surah.
  /// Mengembalikan `Future` yang berisi `List<QuranSurahModel>` jika berhasil,
  /// atau melempar `LocalException` jika terjadi kesalahan.
  Future<List<QuranSurahModel>> getAllSurah();

  /// Mengambil data surah berdasarkan ID.
  /// [id] adalah ID surah yang ingin diambil.
  /// Mengembalikan `Future` yang berisi `List<QuranSurahModel>` jika berhasil,
  /// atau melempar `LocalException` jika terjadi kesalahan atau surah tidak ditemukan.
  Future<List<QuranSurahModel>> getSurahById(int id);
}

class SurahLocalDataSourceImpl extends SurahLocalDataSource {
  @override
  Future<List<QuranSurahModel>> getAllSurah() async {
    try {
      String jsonString = await rootBundle
          .loadString('lib/core/database/quran/all_surahs.json');

      List<dynamic> jsonList = json.decode(jsonString);
      List<QuranSurahModel> surahList = QuranSurahModel.fromJsonList(jsonList);

      return surahList;
    } catch (e) {
      throw LocalException(e.toString());
    }
  }

  @override
  Future<List<QuranSurahModel>> getSurahById(int id) async {
    final response =
        await rootBundle.loadString("lib/core/database/quran/all_surahs.json");
    final decodedResponse = json.decode(response);

    if (decodedResponse is! List) {
      throw const LocalException('Invalid data format');
    }

    final List<QuranSurahModel> quranSurahs = decodedResponse
        .map((surahJson) => QuranSurahModel.fromJson(surahJson))
        .toList();

    final surahById = quranSurahs.where((surah) => surah.nomor == id).toList();

    if (surahById.isEmpty) {
      throw const LocalException('Surah not found');
    }

    return surahById;
  }
}
