import 'package:fpdart/fpdart.dart';

import '../../../../core/database/database/bookmark.dart';
import '../../../../core/database/database/last_read.dart';
import '../../../../core/error/failure.dart';
import '../entities/quran_surah.dart';

abstract class SurahRepository {
  Future<Either<Failure, List<QuranSurah>>> getAllSurah();
  Future<Either<Failure, List<QuranSurah>>> getSurahById(int id);
  Future<Either<Failure, void>> addBookmark(
    Ayah ayat,
    int nomorSurah,
    int numberInJuz,
    String namaSurah,
    String via,
  );
  Future<Either<Failure, void>> removeBookmark(int id);
  Future<Either<Failure, List<Bookmark>>> getBookmarks();
  Future<Either<Failure, void>> insertLastRead(LastRead lastRead);
  Future<Either<Failure, LastRead>> getLastRead();
}
