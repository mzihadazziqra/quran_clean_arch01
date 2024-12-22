import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_clean_arch/features/surah/presentation/widgets/tafsir_info.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../domain/entities/quran_surah.dart';
import '../bloc/bookmark_surah_bloc/bookmark_surah_bloc.dart';
import '../bloc/audio_bloc/audio_bloc.dart';
import 'bookmark_icon.dart';

class AyatCard extends StatefulWidget {
  final Ayah ayat;
  final String namaSurah;
  final int nomorSurah;
  final bool showTranslation;
  final bool showLatin;
  final bool isPlaying;
  final VoidCallback onPlay;

  const AyatCard({
    super.key,
    required this.ayat,
    required this.namaSurah,
    required this.nomorSurah,
    required this.showTranslation,
    required this.showLatin,
    required this.isPlaying,
    required this.onPlay,
  });

  @override
  State<AyatCard> createState() => _AyatCardState();
}

class _AyatCardState extends State<AyatCard> {
  bool _isBookmarked = false;
  bool _isPlaying = false;
  bool _isLoading = false;

  late AudioBloc _audioBloc;
  late BookmarkSurahBloc _bookmarkSurahBloc;

  @override
  void initState() {
    super.initState();
    _audioBloc = context.read<AudioBloc>();
    _bookmarkSurahBloc = context.read<BookmarkSurahBloc>();
    _loadInitialBookmarkState();

    // Mendengarkan stream dari AudioBloc
    _audioBloc.stream.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state is AudioPlaying && state.ayat == widget.ayat;
          _isLoading = state is AudioLoading && state.ayat == widget.ayat;
        });
      }
    });
  }

  void _loadInitialBookmarkState() {
    final bookmarkState = _bookmarkSurahBloc.state;
    if (bookmarkState is BookmarksLoaded) {
      setState(() {
        _isBookmarked = bookmarkState.bookmarks
            .any((bookmark) => bookmark.id == widget.ayat.id);
      });
    } else {
      _bookmarkSurahBloc.add(BookmarksFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AudioBloc, AudioState>(
          listener: (context, state) {
            if (mounted) {
              setState(() {
                _isPlaying = state is AudioPlaying && state.ayat == state.ayat;
                _isLoading = state is AudioLoading && state.ayat == state.ayat;
              });
            }
          },
        ),
        BlocListener<BookmarkSurahBloc, BookmarkSurahState>(
          listener: (context, state) {
            if (state is BookmarksLoaded) {
              _loadInitialBookmarkState();
            } else if (state is BookmarkFailure) {
              showSnackbar(context, state.message);
            }
          },
        ),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isPlaying || widget.isPlaying
                ? AppColor.primary1
                : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 79, 69, 82).withOpacity(0.1),
              offset: const Offset(3, 3),
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Arabic Text
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  widget.ayat.arab ?? '',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: "Uthmani",
                    height: 2.2,
                    fontSize: 27,
                    color: _isPlaying ? AppColor.primary1 : AppColor.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Divider
            Container(
              height: 0.5,
              width: double.infinity,
              color: AppColor.divider,
            ),
            // Latin
            widget.showLatin
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    child: Text(
                      widget.ayat.teksLatin ?? '',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: AppColor.primary1,
                        fontSize: 14,
                      ),
                    ),
                  )
                : const SizedBox(),
            // Terjemahan
            widget.showTranslation
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    child: Text(
                      widget.ayat.translation ?? '',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 14,
                      ),
                    ),
                  )
                : const SizedBox(),
            // icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nomor Ayat
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.secondary,
                    ),
                    child: Text(
                      "${widget.ayat.number?.inSurah}",
                      style: const TextStyle(
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // Audio Icon
                      _buildAudioIcon(context),

                      // tafsir info
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => TafsirInfo(
                              tafisr: widget.ayat.tafsir!,
                              namaSurah: widget.namaSurah,
                              nomor: widget.ayat.number!.inSurah!,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.info_outline,
                        ),
                      ),
                      // Bookmark Icon
                      BookmarkIcon(
                        isBookmarked: _isBookmarked,
                        ayat: widget.ayat,
                        nomorSurah: widget.nomorSurah,
                        namaSurah: widget.namaSurah,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioIcon(BuildContext context) {
    return _isLoading
        ? const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(strokeWidth: 3),
          )
        : IconButton(
            onPressed: () {
              _isPlaying
                  ? _audioBloc.add(AudioPauseEvent())
                  : _audioBloc.add(AudioPlayEvent(ayat: widget.ayat));
            },
            icon: Icon(
              _isPlaying ? Icons.pause_circle : Icons.play_circle,
              color: AppColor.primary2,
            ),
          );
  }
}
