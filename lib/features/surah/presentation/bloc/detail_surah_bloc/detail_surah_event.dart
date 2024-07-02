part of 'detail_surah_bloc.dart';

sealed class DetailSurahEvent extends Equatable {
  const DetailSurahEvent();

  @override
  List<Object> get props => [];
}

class DetailSurahFetchById extends DetailSurahEvent {
  final int nomorSurah;

  const DetailSurahFetchById(this.nomorSurah);

  @override
  List<Object> get props => [nomorSurah];
}

class GetLastReadEvent extends DetailSurahEvent {}

class InsertLastReadEvent extends DetailSurahEvent {
  final int nomorSurah;
  final int nomorAyat;
  final String namaSurah;
  final String via;

  const InsertLastReadEvent({
    required this.nomorSurah,
    required this.nomorAyat,
    required this.namaSurah,
    required this.via,
  });

  @override
  List<Object> get props => [
        nomorSurah,
        nomorAyat,
        namaSurah,
        via,
      ];
}
