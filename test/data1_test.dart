import 'package:flutter_test/flutter_test.dart';
import 'package:quran_clean_arch/core/error/exceptions.dart';
import 'package:quran_clean_arch/features/surah/data/datasources/surah_local_data_source.dart';
import 'package:quran_clean_arch/features/surah/data/models/quran_surah_model.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final SurahLocalDataSourceImpl surahLocalDataSourceImpl =
      SurahLocalDataSourceImpl();

  // Mencetak informasi dari setiap ayat dalam daftar response
  try {
    List<QuranSurahModel> response =
        await surahLocalDataSourceImpl.getAllSurah();
    for (var surah in response) {
      if (surah.audioFull != null) {
        print(surah.audioFull!.abdulMuhsinAlQasim);
      } else {
        print('AudioFull for ${surah.nama} is not available.');
      }
      print(surah.nama);
      print(surah.namaLatin);
      print(surah.audioFull!.abdulMuhsinAlQasim);
      // for (var ayah in surah.ayahs) {
      //   print('Nomor Ayat: ${ayah.number!.inSurah}');
      //   print('Teks Arab: ${ayah.arab}');
      //   print('Latin: ${ayah.teksLatin}');
      //   print('Arti: ${ayah.translation}');
      //   print('Tafsir: ${ayah.tafsir!.kemenag!.short} ');
      //   print('Audio: ${ayah.audio?.muhammadjibreel} ');
      //   print('---------------------------------');
      // }
    }
  } on LocalException catch (e) {
    throw e.message;
  }
}
