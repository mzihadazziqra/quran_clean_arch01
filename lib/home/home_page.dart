import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_clean_arch/core/theme/app_color.dart';

import '../features/bookmark/presentation/pages/bookmark_page.dart';
import '../features/surah/presentation/widgets/detail_surah_bloc/detail_surah_bloc.dart';
import '../features/surah/presentation/widgets/last_read/last_read_bloc.dart';
import '../features/surah/presentation/bloc/surah_bloc/surah_bloc.dart';
import '../features/surah/presentation/pages/list_surah.dart';
import '../features/surah/presentation/widgets/last_read_banner.dart';
import 'widgets/home_tab_bar.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomePage());
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<SurahBloc>().add(SurahFetchAllSurahs());
    context.read<LastReadBloc>().add(FetchLastRead());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Al-Quran Indonesia',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.primary2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: LastReadBanner(),
                ),
              ),
              BlocListener<DetailSurahBloc, DetailSurahState>(
                listener: (context, state) {
                  if (state is InsertLastReadSuccess) {
                    context.read<LastReadBloc>().add(FetchLastRead());
                  }
                },
                child: const SliverAppBar(
                  centerTitle: true,
                  elevation: 0,
                  pinned: true,
                  shape: Border(
                    bottom: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  backgroundColor: AppColor.backgroundColor,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: HomeTabBar(),
                  ),
                ),
              ),
            ],
            body: const TabBarView(
              children: [
                ListSurah(),
                BookmarkPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
