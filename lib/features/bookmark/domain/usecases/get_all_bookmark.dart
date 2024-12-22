import 'package:fpdart/fpdart.dart';

import '../../../../core/database/database/bookmark.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/common/usecase/usecase.dart';
import '../repositories/bookmark_repository.dart';

/// Use case untuk mendapatkan semua bookmark.
class GetAllBookmark implements Usecase<List<Bookmark>, NoParams> {
  final BookmarkRepository repository;

  GetAllBookmark(this.repository);

  @override
  Future<Either<Failure, List<Bookmark>>> call(NoParams params) async {
    return await repository.getAllBookmarks();
  }
}
