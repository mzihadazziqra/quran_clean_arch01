import 'package:fpdart/fpdart.dart';
import '../../../../core/database/database/last_read.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/surah_repository.dart';

// Kelas untuk mendapatkan data bacaan terakhir, mengimplementasikan usecase
class GetLastRead implements Usecase<LastRead?, NoParams> {
  final SurahRepository repository;

  // Konstruktor untuk menginisialisasi repository
  GetLastRead(this.repository);

  // Implementasi metode call untuk mendapatkan data bacaan terakhir
  @override
  Future<Either<Failure, LastRead?>> call(NoParams params) async {
    return await repository.getLastRead();
  }
}
