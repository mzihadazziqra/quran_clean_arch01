part of 'last_read_bloc.dart';

sealed class LastReadState extends Equatable {
  const LastReadState();

  @override
  List<Object?> get props => [];
}

final class LastReadInitial extends LastReadState {}

class LastReadLoading extends LastReadState {}

class LastReadFailure extends LastReadState {
  final String message;

  const LastReadFailure(this.message);

  @override
  List<Object> get props => [message];
}

class LastReadLoaded extends LastReadState {
  final LastRead? lastRead;

  const LastReadLoaded(this.lastRead);

  @override
  List<Object?> get props => [lastRead];
}

