import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/src/img_string.dart';
import '../../domain/entities/quran_surah.dart';

class DetailSurahBanner extends StatelessWidget {
  final QuranSurah surah;
  final Function()? onPressed;

  const DetailSurahBanner({
    super.key,
    required this.surah,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.secondary,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -30,
                      right: -100,
                      child: Opacity(
                        opacity: 0.2,
                        child: SvgPicture.asset(
                          ImgString.quran2_assets,
                          width: 324,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${surah.namaLatin}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26,
                                  color: AppColor.textPrimary,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${surah.arti}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                  color: AppColor.textPrimary,
                                ),
                              ),
                              Text(
                                "${surah.revelation}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: AppColor.textSecondary,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Surah",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColor.textPrimary,
                                ),
                              ),
                              Text(
                                "${surah.nomor}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                  color: AppColor.textSecondary,
                                ),
                              ),
                              Text(
                                "${surah.jumlahAyat} Ayat",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppColor.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
