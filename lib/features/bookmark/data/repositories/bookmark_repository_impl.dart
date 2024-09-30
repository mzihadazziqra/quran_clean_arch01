import 'package:fpdart/fpdart.dart';

import '../../../../core/database/database/bookmark.dart';
import '../../../../core/database/database/database_helper.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/bookmark_repository.dart';

/// Implementasi dari BookmarkRepository yang menghubungkan dengan database.
class BookmarkRepositoryImpl implements BookmarkRepository {
  final DatabaseHelper databaseHelper;

  BookmarkRepositoryImpl(this.databaseHelper);

  /// Mengambil semua bookmark dari database.
  @override
  Future<Either<Failure, List<Bookmark>>> getAllBookmarks() async {
    try {
      // Mengambil daftar bookmark dari database
      final bookmarks = await databaseHelper.getBookmarks();
      return right(bookmarks);
    } on LocalException catch (e) {
      // Mengembalikan error jika terjadi pengecualian lokal
      return left(Failure(e.message));
    }
  }
}
