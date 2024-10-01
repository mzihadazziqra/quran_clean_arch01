import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/src/img_string.dart';
import '../../domain/entities/quran_surah.dart';

/// Widget untuk menampilkan kartu surah dalam daftar surah.
class SurahCard extends StatelessWidget {
  final QuranSurah surah; // Data surah yang akan ditampilkan.
  final Function()? onPressed; // Callback ketika kartu surah ditekan.

  /// Constructor untuk membuat instance SurahCard.
  const SurahCard({
    super.key,
    required this.surah,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        ImgString.pattern_assets,
                        // ignore: deprecated_member_use
                        color: AppColor.primary2,
                      ),
                      SizedBox(
                        child: Text(
                          "${surah.nomor}",
                          style: const TextStyle(
                            color: AppColor.textPrimary,
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          surah.namaLatin ?? '',
                          style: const TextStyle(
                            color: AppColor.textPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              "${surah.jumlahAyat} ayat | ${surah.revelation}",
                              style: const TextStyle(
                                color: AppColor.textSecondary,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    surah.nama ?? '',
                    style: const TextStyle(
                      color: AppColor.primary2,
                      fontFamily: "Uthmani",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColor.divider,
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
