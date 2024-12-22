import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/database/database/last_read.dart';
import '../../../domain/entities/quran_surah.dart';
import '../../../domain/usecases/get_surah_by_id.dart';
import '../../../domain/usecases/insert_last_read.dart';

part 'detail_surah_event.dart';
part 'detail_surah_state.dart';

// Bloc untuk mengelola detail sebuah surah Al-Quran
class DetailSurahBloc extends Bloc<DetailSurahEvent, DetailSurahState> {
  final GetSurahById _getSurahById;
  final InsertLastRead _insertLastRead;

  DetailSurahBloc({
    required GetSurahById getSurahById,
    required InsertLastRead insertLastRead,
  })  : _getSurahById = getSurahById,
        _insertLastRead = insertLastRead,
        super(DetailSurahInitial()) {
    on<DetailSurahFetchById>(_onSurahFetchById);
    on<InsertLastReadEvent>(_onInsertLastRead);
  }

  // Handler untuk event DetailSurahFetchById
  void _onSurahFetchById(
      DetailSurahFetchById event, Emitter<DetailSurahState> emit) async {
    emit(DetailSurahLoading());
    final res = await _getSurahById(event.nomorSurah);
    res.fold(
      (l) => emit(DetailSurahError(l.message)),
      (r) => emit(DetailSurahSuccess(r.first)),
    );
  }

  // Handler untuk event InsertLastReadEvent
  void _onInsertLastRead(
      InsertLastReadEvent event, Emitter<DetailSurahState> emit) async {
    final lastRead = LastRead(
      nomorSurah: event.nomorSurah,
      nomorAyat: event.nomorAyat,
      namaSurah: event.namaSurah,
      via: event.via,
    );
    final res = await _insertLastRead(lastRead);
    res.fold(
      (l) => emit(DetailSurahError(l.message)),
      (r) => emit(InsertLastReadSuccess()),
    );
  }
}
