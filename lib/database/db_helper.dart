import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    String path = join(
      await getDatabasesPath(),
      'kawan_hijau.db',
    );

    return await openDatabase(
      path,
      version: 3,

      onCreate: (db, version) async {

        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT,
            password TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE tanaman(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nama TEXT,
  kategori TEXT,
  gambar TEXT,
  jadwal_siram TEXT,
  jadwal_pupuk TEXT,
  catatan TEXT
)
        ''');

        await db.insert(
          'users',
          {
            'email': 'admin@gmail.com',
            'password': '123456',
          },
        );
      },
    );
  }

  static Future<int> insertTanaman(
      Map<String, dynamic> data) async {

    final db = await database;

    return await db.insert(
      'tanaman',
      data,
    );
  }

  static Future<List<Map<String, dynamic>>> getTanaman() async {

    final db = await database;

    return await db.query(
      'tanaman',
      orderBy: 'id DESC',
    );
  }

  static Future<int> deleteTanaman(
      int id) async {

    final db = await database;

    return await db.delete(
      'tanaman',
      where: 'id=?',
      whereArgs: [id],
    );
  }

  static Future<int> updateTanaman(
  Map<String, dynamic> data,
  int id,
) async {

  final db = await database;

  return await db.update(
    'tanaman',
    data,
    where: 'id=?',
    whereArgs: [id],
  );
}

  static Future<bool> loginUser(
    String email,
    String password,
  ) async {

    final db = await database;

    final result = await db.query(
      'users',
      where: 'email=? AND password=?',
      whereArgs: [email, password],
    );

    return result.isNotEmpty;
  }
}

