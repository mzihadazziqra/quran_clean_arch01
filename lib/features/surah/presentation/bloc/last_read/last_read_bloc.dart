import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/database/database/last_read.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/usecases/get_last_read.dart';

part 'last_read_event.dart';
part 'last_read_state.dart';

class LastReadBloc extends Bloc<LastReadEvent, LastReadState> {
  final GetLastRead _getLastRead;

  LastReadBloc({
    required GetLastRead getLastRead,
  })  : _getLastRead = getLastRead,
        super(LastReadInitial()) {
    on<FetchLastRead>(_onFetchLastRead);
  }

  void _onFetchLastRead(
      FetchLastRead event, Emitter<LastReadState> emit) async {
    emit(LastReadLoading());
    final res = await _getLastRead(NoParams());
    res.fold(
      (l) => emit(LastReadFailure(l.message)),
      (r) => emit(LastReadLoaded(r)),
    );
  }
}
