import '../../../features/surah/domain/entities/quran_surah.dart';

class Bookmark {
  final int id;
  final int nomorSurah;
  final Number number;
  final String arab;
  final String translation;
  final Meta meta;
  final String namaSurah;
  final String via;

  Bookmark({
    required this.id,
    required this.number,
    required this.arab,
    required this.translation,
    required this.meta,
    required this.nomorSurah,
    required this.namaSurah,
    required this.via,
  });
}
