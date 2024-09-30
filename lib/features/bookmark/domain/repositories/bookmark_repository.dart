import 'package:fpdart/fpdart.dart';

import '../../../../core/database/database/bookmark.dart';
import '../../../../core/error/failure.dart';

/// Kontrak untuk repository yang bertanggung jawab mengelola bookmark.
abstract class BookmarkRepository {
  /// Mengambil semua bookmark dari sumber data.
  Future<Either<Failure, List<Bookmark>>> getAllBookmarks();
}
