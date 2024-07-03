import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/src/img_string.dart';
import '../../../../init_dependencies.dart';
import '../../domain/entities/quran_surah.dart';
import '../bloc/audio_bloc/audio_bloc.dart';
import '../bloc/bookmark_surah_bloc/bookmark_surah_bloc.dart';
import '../bloc/detail_surah_bloc/detail_surah_bloc.dart';
import '../bloc/surah_bloc/surah_bloc.dart';
import '../widgets/ayat_card.dart';
import '../widgets/detail_surah_banner.dart';
import '../widgets/detail_surah_settings.dart';

class DetailSurahPage extends StatefulWidget {
  final int nomorSurah;
  final String namaSurah;
  final int? indexAyat;
  const DetailSurahPage({
    super.key,
    required this.nomorSurah,
    this.indexAyat,
    required this.namaSurah,
  });

  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;

    return MaterialPageRoute(
      builder: (_) => DetailSurahPage(
        nomorSurah: args['nomorSurah'],
        indexAyat: args['indexAyat'],
        namaSurah: args['namaSurah'],
      ),
    );
  }

  @override
  State<DetailSurahPage> createState() => _DetailSurahPageState();
}

class _DetailSurahPageState extends State<DetailSurahPage> {
  final AutoScrollController _scrollController = AutoScrollController();
  late DetailSurahBloc detailSurahBloc;
  final GetStorage _box = GetStorage();

  int _lastReadIndex = 0;
  bool showTranslation = true;
  bool showLatin = true;

  @override
  void initState() {
    super.initState();
    detailSurahBloc = context.read<DetailSurahBloc>();
    detailSurahBloc.add(DetailSurahFetchById(widget.nomorSurah));
    context.read<BookmarkSurahBloc>().add(BookmarksFetched());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToIndex();
    });
    _loadSettings();
  }

  void _loadSettings() {
    showTranslation = _box.read('showTranslation') ?? true;
    showLatin = _box.read('showLatin') ?? true;
    setState(() {});
  }

  void _onTranslationChanged(bool value) {
    setState(() {
      showTranslation = value;
      _box.write('showTranslation', value);
    });
  }

  void _onLatinChanged(bool value) {
    setState(() {
      showLatin = value;
      _box.write('showLatin', value);
    });
  }

  void scrollToIndex() {
    if (widget.indexAyat != null) {
      _scrollController.scrollToIndex(
        widget.indexAyat!,
        preferPosition: AutoScrollPosition.begin,
      );
    }
  }

  void _onVisibilityChanged(int index, bool visible) {
    if (visible) {
      setState(() {
        _lastReadIndex = index;
      });
    }
  }

  @override
  void dispose() {
    final detailSurahState = detailSurahBloc.state;
    if (detailSurahState is DetailSurahSuccess) {
      final surah = detailSurahState.surah;
      detailSurahBloc.add(InsertLastReadEvent(
        nomorSurah: widget.nomorSurah,
        nomorAyat: _lastReadIndex + 1,
        namaSurah: surah.namaLatin!,
        via: 'surah',
      ));
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.namaSurah),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => DetailSurahSettings(
                  showLatin: showLatin,
                  showTranslation: showTranslation,
                  onTranslationChanged: _onTranslationChanged,
                  onLatinChanged: _onLatinChanged,
                ),
              );
            },
            icon: const Icon(
              Icons.layers,
              color: AppColor.primary1,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<AudioBloc>(
            create: (context) => serviceLocator<AudioBloc>(),
          ),
          BlocProvider<BookmarkSurahBloc>(
            create: (context) => serviceLocator<BookmarkSurahBloc>(),
          ),
        ],
        child: BlocBuilder<DetailSurahBloc, DetailSurahState>(
          builder: (context, state) {
            if (state is SurahLoading) {
              return const Loader();
            } else if (state is DetailSurahSuccess) {
              return BlocBuilder<BookmarkSurahBloc, BookmarkSurahState>(
                builder: (context, bookmarkState) {
                  context.read<BookmarkSurahBloc>().add(BookmarksFetched());
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    controller: _scrollController,
                    itemCount: state.surah.ayahs.length,
                    itemBuilder: (context, index) {
                      Ayah ayat = state.surah.ayahs[index];
                      return VisibilityDetector(
                        key: Key('ayat-$index'),
                        onVisibilityChanged: (VisibilityInfo info) {
                          if (info.visibleFraction > 0.5) {
                            _onVisibilityChanged(index, true);
                          }
                        },
                        child: AutoScrollTag(
                          key: ValueKey(index),
                          controller: _scrollController,
                          index: index,
                          child: Column(
                            children: [
                              if (ayat.number?.inSurah == 1)
                                Column(
                                  children: [
                                    DetailSurahBanner(
                                      onPressed: () {},
                                      surah: state.surah,
                                    ),
                                    const SizedBox(height: 20),
                                    if (state.surah.nomor != 1 &&
                                        state.surah.nomor != 9)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: SvgPicture.asset(
                                          ImgString.bismillah_assets,
                                          // ignore: deprecated_member_use
                                          color: AppColor.textPrimary,
                                        ),
                                      ),
                                  ],
                                ),
                              BlocProvider.value(
                                value: BlocProvider.of<AudioBloc>(context),
                                child: BlocProvider.value(
                                  value: BlocProvider.of<BookmarkSurahBloc>(
                                      context),
                                  child: AyatCard(
                                    ayat: ayat,
                                    namaSurah: state.surah.namaLatin!,
                                    nomorSurah: state.surah.nomor!,
                                    key: ValueKey(ayat.id),
                                    showTranslation: showTranslation,
                                    showLatin: showLatin,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is DetailSurahError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
