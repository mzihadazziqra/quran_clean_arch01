import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/quran_surah.dart';
import '../../../domain/usecases/get_all_surah.dart';

part 'surah_event.dart';
part 'surah_state.dart';

// Bloc untuk mengelola state terkait daftar surah Al-Quran
class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final GetAllSurah _getAllSurah;

  SurahBloc({
    required GetAllSurah getAllSurah,
  })  : _getAllSurah = getAllSurah,
        super(SurahInitial()) {
    on<SurahFetchAllSurahs>(_onFetchAllSurah);
  }

  // Method private untuk meng-handle event SurahFetchAllSurahs
  void _onFetchAllSurah(
      SurahFetchAllSurahs event, Emitter<SurahState> emit) async {
    emit(SurahLoading());
    final failureOrSurahs = await _getAllSurah(NoParams());
    failureOrSurahs.fold(
      (l) => emit(SurahFailure(l.message)),
      (r) => emit(SurahDisplaySuccess(r)),
    );
  }
}
