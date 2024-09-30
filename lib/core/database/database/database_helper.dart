import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../features/surah/domain/entities/quran_surah.dart';
import 'bookmark.dart';
import 'last_read.dart';

/// Kelas helper untuk mengelola database SQLite.
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  /// Mendapatkan instance dari database.
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('quran.db');

    return _database!;
  }

  /// Inisialisasi database.
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  /// Membuat struktur tabel-tabel di database.
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE bookmarks (
        id INTEGER PRIMARY KEY,
        numberInSurah INTEGER,
        numberInJuz INTEGER,
        arab TEXT,
        translation TEXT,
        nomorSurah INTEGER,
        namaSurah TEXT, 
        via TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE last_read (
        id INTEGER PRIMARY KEY,
        nomorSurah INTEGER,
        nomorAyat INTEGER,
        namaSurah TEXT, 
        via TEXT
      )
    ''');
  }

  /// Menyimpan bookmark ke dalam tabel bookmarks.
  Future<int> insertBookmark(
    Ayah ayat,
    int nomorSurah,
    int numberInJuz,
    String namaSurah,
    String via,
  ) async {
    final db = await instance.database;

    return await db.insert('bookmarks', {
      'numberInSurah': ayat.number?.inSurah,
      'arab': ayat.arab,
      'translation': ayat.translation,
      'nomorSurah': nomorSurah,
      'numberInJuz': numberInJuz,
      'id': ayat.id,
      'namaSurah': namaSurah,
      'via': via,
    });
  }

  /// Mengambil daftar semua bookmark dari tabel bookmarks.
  Future<List<Bookmark>> getBookmarks() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('bookmarks');

    return List.generate(maps.length, (i) {
      return Bookmark(
        id: maps[i]['id'],
        number: Number(
          inQuran: null,
          inSurah: maps[i]['numberInSurah'],
        ),
        arab: maps[i]['arab'],
        translation: maps[i]['translation'],
        meta: Meta(
          juz: maps[i]['numberInJuz'],
          page: null,
          manzil: null,
          ruku: null,
          hizbQuarter: null,
          sajda: null,
        ),
        namaSurah: maps[i]['namaSurah'],
        via: maps[i]['via'],
        nomorSurah: maps[i]['nomorSurah'],
      );
    });
  }

  /// Menghapus bookmark berdasarkan ID dari tabel bookmarks.
  Future<int> deleteBookmark(int id) async {
    final db = await instance.database;

    return await db.delete('bookmarks', where: 'id = ?', whereArgs: [id]);
  }

  /// Menyimpan data last read ke dalam tabel last_read.
  Future<int> insertLastRead(LastRead lastRead) async {
    final db = await instance.database;

    await db.delete('last_read');

    return await db.insert('last_read', lastRead.toMap());
  }

  /// Mengambil data last read dari tabel last_read.
  Future<LastRead?> getLastRead() async {
    try {
      final db = await instance.database;
      final maps = await db.query('last_read', limit: 1);
      if (maps.isNotEmpty) {
        return LastRead.fromMap(maps.first);
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
