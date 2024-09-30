import 'package:fpdart/fpdart.dart';
import '../../../../core/database/database/bookmark.dart';
import '../../../../core/database/database/last_read.dart';
import '../../../../core/error/failure.dart';
import '../entities/quran_surah.dart';

// Mendeklarasikan kontrak repository untuk Surah.
abstract class SurahRepository {
  // Mendeklarasikan metode untuk mendapatkan semua surah.
  Future<Either<Failure, List<QuranSurah>>> getAllSurah();

  // Mendeklarasikan metode untuk mendapatkan surah berdasarkan id.
  Future<Either<Failure, List<QuranSurah>>> getSurahById(int id);

  // Mendeklarasikan metode untuk menambahkan bookmark.
  Future<Either<Failure, void>> addBookmark(
    Ayah ayat,
    int nomorSurah,
    int numberInJuz,
    String namaSurah,
    String via,
  );

  // Mendeklarasikan metode untuk menghapus bookmark berdasarkan id.
  Future<Either<Failure, void>> removeBookmark(int id);

  // Mendeklarasikan metode untuk mendapatkan semua bookmark.
  Future<Either<Failure, List<Bookmark>>> getBookmarks();

  // Mendeklarasikan metode untuk menyimpan data bacaan terakhir.
  Future<Either<Failure, void>> insertLastRead(LastRead lastRead);

  // Mendeklarasikan metode untuk mendapatkan data bacaan terakhir.
  Future<Either<Failure, LastRead>> getLastRead();
}
