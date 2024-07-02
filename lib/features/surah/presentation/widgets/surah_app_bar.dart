import 'package:flutter/material.dart';
import 'package:quran_clean_arch/core/utils/extension/extrack_name_qori.dart';

import '../../domain/entities/quran_surah.dart';

class SurahAppBar extends StatelessWidget {
  final QuranSurah surah;
  final Function()? onPressed;
  const SurahAppBar({
    super.key,
    required this.surah,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.play_circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            extractQariName(surah.audioFull!.abdulMuhsinAlQasim!),
          ),
        ],
      ),
    );
  }
}
