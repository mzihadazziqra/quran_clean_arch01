import 'package:fpdart/fpdart.dart';

import '../../../../core/data/database/last_read.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/surah_repository.dart';

class InsertLastRead implements Usecase<void, LastRead> {
  final SurahRepository repository;

  InsertLastRead(this.repository);

  @override
  Future<Either<Failure, void>> call(LastRead lastRead) async {
    return await repository.insertLastRead(lastRead);
  }
}
