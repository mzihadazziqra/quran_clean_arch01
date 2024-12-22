import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import 'core/theme/theme.dart';
import 'features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'features/surah/presentation/widgets/audio_bloc/audio_bloc.dart';
import 'features/surah/presentation/widgets/bookmark_surah_bloc/bookmark_surah_bloc.dart';
import 'features/surah/presentation/widgets/detail_surah_bloc/detail_surah_bloc.dart';
import 'features/surah/presentation/widgets/last_read/last_read_bloc.dart';
import 'features/surah/presentation/bloc/surah_bloc/surah_bloc.dart';
import 'features/surah/presentation/pages/detail_surah_page.dart';
import 'home/home_page.dart';
import 'init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await GetStorage.init();
  runApp(MultiBlocProvider(
    // Deklarasi Providers
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<SurahBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<DetailSurahBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<BookmarkSurahBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AudioBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<BookmarkBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<LastReadBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al-Quran Indonesia',
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: AppTheme.lightTheme.colorScheme,
        iconTheme: AppTheme.lightTheme.iconTheme,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
      // Detail surah dengan argumen
      onGenerateRoute: (settings) {
        if (settings.name == '/detail_surah') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => DetailSurahPage(
              nomorSurah: args['nomorSurah'],
              indexAyat: args['indexAyat'],
              namaSurah: args['namaSurah'],
            ),
          );
        }
        return null;
      },
    );
  }
}
