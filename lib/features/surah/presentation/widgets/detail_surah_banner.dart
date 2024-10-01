import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/src/img_string.dart';
import '../../domain/entities/quran_surah.dart';

// Widget untuk banner untuk detail surah
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
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffdf98fa).withOpacity(0.5),
                  // spreadRadius: 0.1,
                  offset: const Offset(
                    0,
                    9,
                  ),
                  blurRadius: 15,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0, 0.6, 1],
                    colors: [
                      Color(0xFFDF98FA),
                      Color(0xFFB070FD),
                      Color(0xFF9055FF)
                    ],
                  ),
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
                          // Informasi nama surah dan arti
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${surah.namaLatin}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26,
                                  color: AppColor.white,
                                ),
                              ),
                              Text(
                                "${surah.arti}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                  color: AppColor.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${surah.revelation}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: AppColor.white,
                                ),
                              ),
                            ],
                          ),
                          // Informasi nomor surah dan jumlah ayat
                          Column(
                            children: [
                              const Text(
                                "Surah",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColor.white,
                                ),
                              ),
                              Text(
                                "${surah.nomor}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                  color: AppColor.white,
                                ),
                              ),
                              Text(
                                "${surah.jumlahAyat} Ayat",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppColor.white,
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
