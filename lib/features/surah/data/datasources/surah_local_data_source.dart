import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/error/exceptions.dart';
import '../models/quran_surah_model.dart';

abstract class SurahLocalDataSource {
  Future<List<QuranSurahModel>> getAllSurah();
  Future<List<QuranSurahModel>> getSurahById(int id);
}

class SurahLocalDataSourceImpl extends SurahLocalDataSource {
  @override
  Future<List<QuranSurahModel>> getAllSurah() async {
    try {
      String jsonString =
          await rootBundle.loadString('lib/core/data/quran/all_surahs.json');

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
        await rootBundle.loadString("lib/core/data/quran/all_surahs.json");
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
