part of 'last_read_bloc.dart';

// State class untuk mengelola berbagai status terkait data terakhir yang dibaca (Last Read)
sealed class LastReadState extends Equatable {
  const LastReadState();

  @override
  List<Object?> get props => [];
}

// State awal ketika blok dimulai
final class LastReadInitial extends LastReadState {}

// State untuk menunjukkan bahwa blok sedang memuat data terakhir yang dibaca
class LastReadLoading extends LastReadState {}

// State untuk menunjukkan bahwa terjadi kesalahan dalam memuat data terakhir yang dibaca
class LastReadFailure extends LastReadState {
  final String message;

  const LastReadFailure(this.message);

  @override
  List<Object> get props => [message];
}

// State untuk menunjukkan bahwa data terakhir yang dibaca berhasil dimuat
class LastReadLoaded extends LastReadState {
  final LastRead? lastRead;

  const LastReadLoaded(this.lastRead);

  @override
  List<Object?> get props => [lastRead];
}
