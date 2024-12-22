part of 'last_read_bloc.dart';

sealed class LastReadEvent extends Equatable {
  const LastReadEvent();

  @override
  List<Object> get props => [];
}

class FetchLastRead extends LastReadEvent {}
