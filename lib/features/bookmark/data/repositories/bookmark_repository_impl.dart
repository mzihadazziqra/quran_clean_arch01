import 'package:fpdart/fpdart.dart';

import '../../../../core/database/database/bookmark.dart';
import '../../../../core/database/database/database_helper.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final DatabaseHelper databaseHelper;

  BookmarkRepositoryImpl(this.databaseHelper);

  @override
  Future<Either<Failure, List<Bookmark>>> getAllBookmarks() async {
    try {
      final bookmarks = await databaseHelper.getBookmarks();
      return right(bookmarks);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }
}
