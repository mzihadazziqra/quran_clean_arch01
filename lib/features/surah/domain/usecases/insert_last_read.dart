import 'package:fpdart/fpdart.dart';
import '../../../../core/database/database/last_read.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/surah_repository.dart';

// Kelas untuk menyimpan data bacaan terakhir, mengimplementasikan usecase
class InsertLastRead implements Usecase<void, LastRead> {
  final SurahRepository repository;

  // Konstruktor untuk menginisialisasi repository
  InsertLastRead(this.repository);

  // Implementasi metode call untuk menyimpan data bacaan terakhir
  @override
  Future<Either<Failure, void>> call(LastRead lastRead) async {
    return await repository.insertLastRead(lastRead);
  }
}
