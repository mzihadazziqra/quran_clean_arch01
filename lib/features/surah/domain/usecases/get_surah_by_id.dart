import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/quran_surah.dart';
import '../repositories/surah_repository.dart';

class GetSurahById implements Usecase<List<QuranSurah>, int> {
  final SurahRepository repository;

  GetSurahById(this.repository);

  @override
  Future<Either<Failure, List<QuranSurah>>> call(int id) async {
    return await repository.getSurahById(id);
  }
}
