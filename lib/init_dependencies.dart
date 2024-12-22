import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'core/database/audio/just_audio_provider.dart';
import 'core/database/database/database_helper.dart';
import 'features/bookmark/data/repositories/bookmark_repository_impl.dart';
import 'features/bookmark/domain/repositories/bookmark_repository.dart';
import 'features/bookmark/domain/usecases/get_all_bookmark.dart';
import 'features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'features/surah/domain/usecases/bookmark.dart';
import 'features/surah/domain/usecases/get_last_read.dart';
import 'features/surah/domain/usecases/get_surah_by_id.dart';
import 'features/surah/domain/usecases/insert_last_read.dart';
import 'features/surah/presentation/bloc/bookmark_surah_bloc/bookmark_surah_bloc.dart';
import 'features/surah/presentation/bloc/detail_surah_bloc/detail_surah_bloc.dart';
import 'features/surah/presentation/bloc/last_read/last_read_bloc.dart';

import 'core/common/domain/audio_provider.dart';
import 'core/common/network/connection_checker.dart';
import 'features/surah/data/datasources/surah_local_data_source.dart';
import 'features/surah/data/repositories/surah_repository_impl.dart';
import 'features/surah/domain/repositories/surah_repository.dart';
import 'features/surah/domain/usecases/get_all_surah.dart';
import 'features/surah/presentation/bloc/audio_bloc/audio_bloc.dart';
import 'features/surah/presentation/bloc/surah_bloc/surah_bloc.dart';

part 'init_dependencies_main.dart';
