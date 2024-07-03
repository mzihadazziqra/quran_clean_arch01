import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widgets/loader.dart';

import '../bloc/surah_bloc/surah_bloc.dart';
import '../widgets/surah_card.dart';

class ListSurah extends StatelessWidget {
  const ListSurah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SurahBloc, SurahState>(
        builder: (context, state) {
          if (state is SurahLoading) {
            return const Loader();
          } else if (state is SurahDisplaySuccess) {
            return ListView.builder(
              itemCount: state.surahs.length,
              itemBuilder: (context, index) {
                final surah = state.surahs[index];
                return SurahCard(
                  surah: surah,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/detail_surah',
                      arguments: {
                        'nomorSurah': surah.nomor,
                        'namaSurah': surah.namaLatin,
                        'indexAyat': null,
                      },
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "Error atau state awal",
              ),
            );
          }
        },
      ),
    );
  }
}
