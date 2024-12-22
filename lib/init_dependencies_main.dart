part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initDatabase();
  _initSurah();
  _initBookmarks();
  serviceLocator.registerFactory(() => InternetConnection());

  // Core
  serviceLocator.registerFactory<ConnectionChecker>(
      () => ConnectionCheckerImpl(serviceLocator()));
}

void _initSurah() {
  // DataSource
  serviceLocator
    ..registerFactory<SurahLocalDataSource>(
      () => SurahLocalDataSourceImpl(),
    )
    // Repository
    ..registerFactory<SurahRepository>(
      () => SurahRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )

    // Usecases
    ..registerFactory(
      () => GetAllSurah(serviceLocator()),
    )
    ..registerFactory(
      () => GetSurahById(serviceLocator()),
    )
    ..registerFactory(
      () => AddBookmark(serviceLocator()),
    )
    ..registerFactory(
      () => RemoveBookmark(serviceLocator()),
    )
    ..registerFactory(
      () => GetBookmarks(serviceLocator()),
    )
    ..registerFactory(
      () => InsertLastRead(serviceLocator()),
    )
    ..registerFactory(
      () => GetLastRead(serviceLocator()),
    )

// Blocs (Pemisahan Bloc)
    ..registerLazySingleton(
      () => SurahBloc(
        getAllSurah: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DetailSurahBloc(
        getSurahById: serviceLocator(),
        insertLastRead: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => BookmarkSurahBloc(
        addBookmark: serviceLocator(),
        removeBookmark: serviceLocator(),
        getBookmarks: serviceLocator(),
      ),
    )
    ..registerLazySingleton<AudioProvider>(
      () => JustAudioProvider(),
    )
    ..registerFactory(
      () => AudioBloc(
        audioProvider: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => LastReadBloc(
        getLastRead: serviceLocator<GetLastRead>(),
      ),
    );
}

void _initDatabase() {
  serviceLocator.registerLazySingleton<DatabaseHelper>(
    () => DatabaseHelper.instance,
  );
}

void _initBookmarks() {
  // bloc
  serviceLocator
    ..registerFactory(
      () => BookmarkBloc(
        getAllBookmarks: serviceLocator(),
      ),
    )
    // usecases
    ..registerLazySingleton(
      () => GetAllBookmark(
        serviceLocator(),
      ),
    )
    // repository
    ..registerLazySingleton<BookmarkRepository>(
      () => BookmarkRepositoryImpl(
        serviceLocator(),
      ),
    );
}
