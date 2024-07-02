import 'package:fpdart/fpdart.dart';
import 'package:quran_clean_arch/core/data/database/last_read.dart';

import '../../../../core/data/database/bookmark.dart';
import '../../../../core/data/database/database_helper.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/quran_surah.dart';
import '../../domain/repositories/surah_repository.dart';
import '../datasources/surah_local_data_source.dart';

class SurahRepositoryImpl extends SurahRepository {
  final SurahLocalDataSource surahLocalDataSource;
  final DatabaseHelper databaseHelper;

  SurahRepositoryImpl(this.surahLocalDataSource, this.databaseHelper);

  @override
  Future<Either<Failure, List<QuranSurah>>> getAllSurah() async {
    try {
      final surahList = await surahLocalDataSource.getAllSurah();

      return right(surahList);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }

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

  @override
  Future<Either<Failure, List<Bookmark>>> getBookmarks() async {
    // Ubah tipe kembalian
    try {
      final bookmarks = await databaseHelper.getBookmarks();
      return right(bookmarks);
    } on LocalException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeBookmark(int id) async {
    try {
      await databaseHelper.deleteBookmark(id);
      return right(null);
    } on LocalException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<QuranSurah>>> getSurahById(int id) async {
    try {
      final surah = await surahLocalDataSource.getSurahById(id);
      return right(surah);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> insertLastRead(LastRead lastRead) async {
    try {
      await databaseHelper.insertLastRead(lastRead);
      return right(null);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }

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
