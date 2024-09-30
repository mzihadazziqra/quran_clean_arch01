import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/show_snackbar.dart';
import '../../domain/entities/quran_surah.dart';
import '../bloc/bookmark_surah_bloc/bookmark_surah_bloc.dart';

// widget bookmark icon untuk tombol menambahkan bookmark pada ayat card pada halaman detail surah
class BookmarkIcon extends StatelessWidget {
  final bool isBookmarked;
  final Ayah ayat;
  final int nomorSurah;
  final String namaSurah;

  const BookmarkIcon({
    super.key,
    required this.isBookmarked,
    required this.ayat,
    required this.nomorSurah,
    required this.namaSurah,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final bookmarkSurahBloc = context.read<BookmarkSurahBloc>();

        // Handle bookmark untuk menambahkan atau menghapus bookmark berdasarkan state bookmark
        if (isBookmarked) {
          bookmarkSurahBloc.add(BookmarkRemoved(ayat.id!));
          showSnackbar(
            context,
            "Bookmark berhasil dihapus",
          );
        } else {
          bookmarkSurahBloc.add(
            BookmarkAdded(
              ayat: ayat,
              nomorSurah: nomorSurah,
              numberInJuz: ayat.meta!.juz!,
              namaSurah: namaSurah,
              via: "surah",
            ),
          );
          showSnackbar(
            context,
            "Bookmark berhasil ditambahkan",
          );
        }
      },
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
      ),
    );
  }
}
