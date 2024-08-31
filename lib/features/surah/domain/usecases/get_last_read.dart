import 'package:fpdart/fpdart.dart';

import '../../../../core/database/database/last_read.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/surah_repository.dart';

class GetLastRead implements Usecase<LastRead?, NoParams> {
  final SurahRepository repository;

  GetLastRead(this.repository);

  @override
  Future<Either<Failure, LastRead?>> call(NoParams params) async {
    return await repository.getLastRead();
  }
}
