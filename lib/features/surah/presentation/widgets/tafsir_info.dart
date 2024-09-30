import 'package:flutter/material.dart';
import '../../../../core/theme/app_color.dart';
import '../../domain/entities/quran_surah.dart';

/// Widget untuk menampilkan informasi tafsir suatu ayat dalam sebuah surah.
class TafsirInfo extends StatelessWidget {
  final Tafsir tafisr;
  final String namaSurah;
  final int nomor;

  /// Constructor untuk membuat instance TafsirInfo.
  const TafsirInfo({
    super.key,
    required this.tafisr,
    required this.namaSurah,
    required this.nomor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Penting untuk bottom sheet
          children: [
            Container(
              height: 5,
              width: 40,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: AppColor.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text("Tafsir surah $namaSurah ayat ke $nomor"),
            const SizedBox(height: 5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: SingleChildScrollView(
                child: Text(
                  tafisr.kemenag!.long!,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
