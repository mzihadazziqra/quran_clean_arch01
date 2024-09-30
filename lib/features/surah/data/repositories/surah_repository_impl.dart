import 'package:fpdart/fpdart.dart';
import '../../../../core/database/database/bookmark.dart';
import '../../../../core/database/database/database_helper.dart';
import '../../../../core/database/database/last_read.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/quran_surah.dart';
import '../../domain/repositories/surah_repository.dart';
import '../datasources/surah_local_data_source.dart';

class SurahRepositoryImpl extends SurahRepository {
  final SurahLocalDataSource surahLocalDataSource;
  final DatabaseHelper databaseHelper;

  SurahRepositoryImpl(this.surahLocalDataSource, this.databaseHelper);

  // Mendapatkan semua surah dari sumber data lokal.
  @override
  Future<Either<Failure, List<QuranSurah>>> getAllSurah() async {
    try {
      final surahList = await surahLocalDataSource.getAllSurah();

      return right(surahList);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }

  // Menambahkan bookmark baru ke database.
  @override
  Future<Either<Failure, void>> addBookmark(
    Ayah ayat,
    int nomorSurah,
    int numberInJuz,
    String namaSurah,
    String via,
  ) async {
    try {
      await databaseHelper.insertBookmark(
        ayat,
        nomorSurah,
        numberInJuz,
        namaSurah,
        via,
      );

      return right(null);
    } on LocalException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // Mendapatkan semua bookmark dari database.
  @override
  Future<Either<Failure, List<Bookmark>>> getBookmarks() async {
    try {
      final bookmarks = await databaseHelper.getBookmarks();

      return right(bookmarks);
    } on LocalException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // Menghapus bookmark berdasarkan id dari database.
  @override
  Future<Either<Failure, void>> removeBookmark(int id) async {
    try {
      await databaseHelper.deleteBookmark(id);

      return right(null);
    } on LocalException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // Mendapatkan surah berdasarkan id dari sumber data lokal.
  @override
  Future<Either<Failure, List<QuranSurah>>> getSurahById(int id) async {
    try {
      final surah = await surahLocalDataSource.getSurahById(id);

      return right(surah);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }

  // Menyimpan data bacaan terakhir ke database.
  @override
  Future<Either<Failure, void>> insertLastRead(LastRead lastRead) async {
    try {
      await databaseHelper.insertLastRead(lastRead);

      return right(null);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }

  // Mendapatkan data bacaan terakhir dari database.
  @override
  Future<Either<Failure, LastRead>> getLastRead() async {
    try {
      final lastRead = await databaseHelper.getLastRead();

      return lastRead != null ? right(lastRead) : Left(CacheFailure());
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }
}
