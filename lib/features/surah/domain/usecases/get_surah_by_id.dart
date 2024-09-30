import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/quran_surah.dart';
import '../repositories/surah_repository.dart';

// Kelas untuk mendapatkan surah berdasarkan id, mengimplementasikan usecase
class GetSurahById implements Usecase<List<QuranSurah>, int> {
  final SurahRepository repository;

  // Konstruktor untuk menginisialisasi repository
  GetSurahById(this.repository);

  // Implementasi metode call untuk mendapatkan surah berdasarkan id
  @override
  Future<Either<Failure, List<QuranSurah>>> call(int id) async {
    return await repository.getSurahById(id);
  }
}
