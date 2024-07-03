import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/src/img_string.dart';
import '../bloc/last_read/last_read_bloc.dart';

class LastReadBanner extends StatelessWidget {
  const LastReadBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? namaSurah;
    int? nomorSurah;
    int? nomorAyat;

    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.secondary,
      ),
      child: InkWell(
        onTap: () {
          if (nomorSurah != null && nomorAyat != null) {
            Navigator.pushNamed(
              context,
              '/detail_surah',
              arguments: {
                'nomorSurah': nomorSurah,
                'namaSurah': namaSurah,
                'indexAyat': nomorAyat! - 1,
              },
            );
          } else {}
        },
        borderRadius: BorderRadius.circular(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Positioned(
                bottom: -8,
                right: 5,
                child: SvgPicture.asset(
                  ImgString.quran2_assets,
                  height: 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    const Row(
                      children: [
                        Icon(
                          Icons.menu_book_rounded,
                          color: AppColor.textPrimary,
                          size: 17,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Terakhir di baca',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: AppColor.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<LastReadBloc, LastReadState>(
                      listener: (context, state) {
                        if (state is LastReadLoaded) {
                          namaSurah = state.lastRead!.namaSurah;
                          nomorSurah = state.lastRead!.nomorSurah;
                          nomorAyat = state.lastRead!.nomorAyat;
                        } else {
                          namaSurah = null;
                          nomorSurah = null;
                          nomorAyat = null;
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              namaSurah ?? 'Terakhir Dibaca',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: AppColor.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 1),
                            Text(
                              'Ayat $nomorAyat',
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: AppColor.textSecondary,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
