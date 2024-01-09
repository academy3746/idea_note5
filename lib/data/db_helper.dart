import 'package:idea_note5/data/idea_info.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database database;

  /// Initialize Database: Open DB Channel
  Future<void> initDatabase() async {
    String path = join(await getDatabasesPath(), 'idea_note.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE IF NOT EXISTS tb_idea (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            motive TEXT,
            content TEXT,
            importance INTEGER,
            feedback TEXT,
            createdAt INTEGER
          )
        ''');
      },
    );
  }

  /// INSERT Database (CREATE)
  Future<int> insertIdeaInfo(IdeaInfo data) async {
    return await database.insert(
      'tb_idea',
      data.toJson(),
    );
  }

  /// SELECT Database (READ)
  Future<List<IdeaInfo>> selectIdeaInfo() async {
    final List<Map<String, dynamic>> data = await database.query('tb_idea');

    return List.generate(
      data.length,
      (index) {
        return IdeaInfo.fromMap(data[index]);
      },
    );
  }

  /// UPDATE Database (UPDATE)
  Future<int> updateIdeaInfo(IdeaInfo data) async {
    return await database.update(
      'tb_idea',
      data.toJson(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  /// DELETE Database (DELETE)
  Future<int> deleteIdeaInfo(int id) async {
    return await database.delete(
      'tb_idea',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Exit Database: Close DB Channel
  Future<void> exitDatabase() async {
    return await database.close();
  }
}
