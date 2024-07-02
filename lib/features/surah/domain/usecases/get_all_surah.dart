import 'package:fpdart/fpdart.dart';
import '../entities/quran_surah.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/surah_repository.dart';

class GetAllSurah implements Usecase<List<QuranSurah>, NoParams> {
  final SurahRepository surahRepository;

  GetAllSurah(this.surahRepository);

  @override
  Future<Either<Failure, List<QuranSurah>>> call(NoParams params) async {
    return await surahRepository.getAllSurah();
  }
}
