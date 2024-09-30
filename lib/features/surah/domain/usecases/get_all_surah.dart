import 'package:fpdart/fpdart.dart';
import '../entities/quran_surah.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/surah_repository.dart';

// Kelas untuk mendapatkan semua surah, mengimplementasikan usecase
class GetAllSurah implements Usecase<List<QuranSurah>, NoParams> {
  final SurahRepository surahRepository;

  // Konstruktor untuk menginisialisasi repository
  GetAllSurah(this.surahRepository);

  // Implementasi metode call untuk mendapatkan semua surah
  @override
  Future<Either<Failure, List<QuranSurah>>> call(NoParams params) async {
    return await surahRepository.getAllSurah();
  }
}
