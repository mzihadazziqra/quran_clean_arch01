import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quran_clean_arch/features/surah/data/datasources/surah_local_data_source.dart';

@GenerateNiceMocks([MockSpec<SurahLocalDataSource>()])
import 'surah_local_data_source_test.mocks.dart';

void main() async {
  // Create mock object.
  var localDataSource = MockSurahLocalDataSource();

  try {
    var response = await localDataSource.getSurahById(1);
    print(response.toList());
  } catch (e) {
    print(e);
  }
}
