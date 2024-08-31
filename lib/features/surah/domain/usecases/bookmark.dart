import 'package:fpdart/fpdart.dart';
import 'package:quran_clean_arch/core/error/failure.dart';
import 'package:quran_clean_arch/core/usecase/usecase.dart';

import '../../../../core/database/database/bookmark.dart';
import '../entities/quran_surah.dart';
import '../repositories/surah_repository.dart';

class AddBookmark implements Usecase<void, BookmarkParams> {
  final SurahRepository repository;

  AddBookmark(this.repository);

  @override
  Future<Either<Failure, void>> call(BookmarkParams params) async {
    return await repository.addBookmark(
      params.ayat,
      params.nomorSurah,
      params.numberInJuz,
      params.namaSurah,
      params.via,
    );
  }
}

class RemoveBookmark implements Usecase<void, int> {
  final SurahRepository repository;

  RemoveBookmark(this.repository);

  @override
  Future<Either<Failure, void>> call(int id) async {
    return await repository.removeBookmark(id);
  }
}

class GetBookmarks implements Usecase<List<Bookmark>, NoParams> {
  // Ubah tipe parameter
  final SurahRepository repository;

  GetBookmarks(this.repository);

  @override
  Future<Either<Failure, List<Bookmark>>> call(NoParams params) async {
    // Ubah tipe kembalian
    return await repository.getBookmarks();
  }
}

class BookmarkParams {
  final Ayah ayat;
  final int nomorSurah;
  final int numberInJuz;
  final String namaSurah;
  final String via;

  BookmarkParams({
    required this.ayat,
    required this.nomorSurah,
    required this.numberInJuz,
    required this.namaSurah,
    required this.via,
  });
}
