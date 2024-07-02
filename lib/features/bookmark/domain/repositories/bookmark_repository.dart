import 'package:fpdart/fpdart.dart';

import '../../../../core/data/database/bookmark.dart';
import '../../../../core/error/failure.dart';

abstract class BookmarkRepository {
  Future<Either<Failure, List<Bookmark>>> getAllBookmarks();
}
