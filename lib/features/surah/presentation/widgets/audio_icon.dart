import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/quran_surah.dart';
import 'audio_bloc/audio_bloc.dart';

class AudioIcon extends StatelessWidget {
  final Ayah ayat;
  final bool isPlaying;
  final bool isLoading;

  const AudioIcon({
    super.key,
    required this.ayat,
    required this.isPlaying,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(strokeWidth: 3),
          )
        : IconButton(
            onPressed: () {
              isPlaying
                  ? context.read<AudioBloc>().add(AudioPauseEvent())
                  : context.read<AudioBloc>().add(AudioPlayEvent(ayat: ayat));
            },
            icon: Icon(
              isPlaying ? Icons.pause_circle : Icons.play_circle,
            ),
          );
  }
}
