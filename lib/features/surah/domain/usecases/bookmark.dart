// ignore_for_file: prefer-match-file-name

import 'package:fpdart/fpdart.dart';
import 'package:quran_clean_arch/core/error/failure.dart';
import 'package:quran_clean_arch/core/common/usecase/usecase.dart';
import '../../../../core/database/database/bookmark.dart';
import '../entities/quran_surah.dart';
import '../repositories/surah_repository.dart';

// Kelas untuk menambahkan bookmark, mengimplementasikan usecase
class AddBookmark implements Usecase<void, BookmarkParams> {
  final SurahRepository repository;

  // Konstruktor untuk menginisialisasi repository
  AddBookmark(this.repository);

  // Implementasi metode call untuk menambahkan bookmark
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

// Kelas untuk menghapus bookmark, mengimplementasikan usecase
class RemoveBookmark implements Usecase<void, int> {
  final SurahRepository repository;

  // Konstruktor untuk menginisialisasi repository
  RemoveBookmark(this.repository);

  // Implementasi metode call untuk menghapus bookmark berdasarkan id
  @override
  Future<Either<Failure, void>> call(int id) async {
    return await repository.removeBookmark(id);
  }
}

// Kelas untuk mendapatkan semua bookmark, mengimplementasikan usecase
class GetBookmarks implements Usecase<List<Bookmark>, NoParams> {
  final SurahRepository repository;

  // Konstruktor untuk menginisialisasi repository
  GetBookmarks(this.repository);

  // Implementasi metode call untuk mendapatkan semua bookmark
  @override
  Future<Either<Failure, List<Bookmark>>> call(NoParams params) async {
    return await repository.getBookmarks();
  }
}

// Kelas parameter untuk menambahkan bookmark
class BookmarkParams {
  final Ayah ayat;
  final int nomorSurah;
  final int numberInJuz;
  final String namaSurah;
  final String via;

  // Konstruktor untuk menginisialisasi parameter bookmark
  BookmarkParams({
    required this.ayat,
    required this.nomorSurah,
    required this.numberInJuz,
    required this.namaSurah,
    required this.via,
  });
}
