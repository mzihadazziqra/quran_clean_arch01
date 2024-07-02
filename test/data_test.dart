// import 'package:flutter/widgets.dart';
// import 'package:quran_clean_arch/core/usecase/usecase.dart';
// import 'package:quran_clean_arch/features/surah/data/datasources/surah_local_data_source.dart';
// import 'package:quran_clean_arch/features/surah/data/repositories/surah_repository_impl.dart';
// import 'package:quran_clean_arch/features/surah/domain/repositories/surah_repository.dart';
// import 'package:quran_clean_arch/features/surah/domain/usecases/get_all_surah.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SurahLocalDataSourceImpl surahLocalDataSourceImpl =
//       SurahLocalDataSourceImpl();
//   final SurahRepository surahRepository = SurahRepositoryImpl(
//       surahLocalDataSourceImpl); // Ganti dengan implementasi sesungguhnya
//   final GetAllSurah getAllSurah = GetAllSurah(surahRepository);

//   final result = await getAllSurah(NoParams());

//   result.fold(
//     (failure) => print(failure.message), // Jika ada kegagalan
//     (surahs) {
//       for (var surah in surahs) {
//         print('Nama: ${surah.nama}');
//         print('Nama Latin: ${surah.namaLatin}');
//         for (var ayah in surah.ayahs) {
//           print('Nomor Ayat: ${ayah.number.inSurah}');
//           print('Teks Arab: ${ayah.arab}');
//           print('Latin: ${ayah.teksLatin}');
//           print('Arti: ${ayah.translation}');
//           print('Tafsir: ${ayah.tafsir.kemenag.short}');
//           print('---------------------------------');
//         }
//       }
//     },
//   );
// }
