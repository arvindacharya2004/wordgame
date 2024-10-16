// ignore_for_file: depend_on_referenced_packages, file_names

import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wordgame/database/quiz.dart';

class dbhelper {
  static const _databasename = 'wordgame';
  static const _tablename = 'questions';

  Database? _database;

  Future<Database?> get gamedatabase async {
    if (_database != null) return _database;

    _database = await initial();
    return _database;
  }

  initial() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databasename);
    return await openDatabase(path, version: 1, onCreate: _oncreate);
  }

  Future _oncreate(Database db, version) async {
    await db.execute('''

    CREATE TABLE $_tablename(
        id INTEGER PRIMARY KEY,
        question TEXT,
        answer TEXT
    );
    ''');
    await db.execute('''

    CREATE TABLE question_ts(
        id INTEGER PRIMARY KEY,
        question TEXT,
        answer TEXT
    );
    ''');
    await db.execute('''

    CREATE TABLE question_sq(
        id INTEGER PRIMARY KEY,
        question TEXT,
        answer TEXT
    );
    ''');
    await db.execute('''

    CREATE TABLE question_ht(
        id INTEGER PRIMARY KEY,
        question TEXT,
        answer TEXT
    );
    ''');

    await db.execute('''

    CREATE TABLE question_ap(
        id INTEGER PRIMARY KEY,
        question TEXT,
        answer TEXT,
        option_a TEXT,
        option_b TEXT,
        option_c TEXT,
        option_d TEXT
        
    );
    ''');

    await db.execute("""
    CREATE TABLE test(id INT,name VARCHAR(20))""");
    await db.execute("""
    CREATE TABLE highscore(score INT,total VARCHAR(20))
    """);

    await db.execute("""
    INSERT INTO test(id,name) values(1,"finalvalue_gk")
    """);
    await db.execute("""
    INSERT INTO highscore(score,total) values(0,"matchscore_gk")
    """);
    await db.execute("""
    INSERT INTO highscore(score,total) values(0,"totalscore_gk")
    """);

    await db.execute("""
    INSERT INTO test(id,name) values(1,"finalvalue_ts")
    """);
    await db.execute("""
    INSERT INTO highscore(score,total) values(0,"matchscore_ts")
    """);
    await db.execute("""
    INSERT INTO highscore(score,total) values(0,"totalscore_ts")
    """);

    await db.execute("""
    INSERT INTO test(id,name) values(1,"finalvalue_sq")
    """);
    await db.execute("""
    INSERT INTO highscore(score,total) values(0,"matchscore_sq")
    """);
    await db.execute("""
    INSERT INTO highscore(score,total) values(0,"totalscore_sq")
    """);

    await db.execute("""
    INSERT INTO test(id,name) values(1,"finalvalue_ap")
    """);
    await db.execute("""
    INSERT INTO highscore(score,total) values(0,"matchscore_ap")
    """);
    await db.execute("""
    INSERT INTO highscore(score,total) values(0,"totalscore_ap")
    """);
    await db.execute("""
    INSERT INTO test(id,name) values(0,"win_ap")
    """);
    await db.execute("""
    INSERT INTO test(id,name) values(0,"lose_ap")
    """);

    await db.execute("""
    INSERT INTO test(id,name) values(1,"finalvalue_ht")
    """);
    await db.execute("""
    INSERT INTO highscore(score,total) values(0,"matchscore_ht")
    """);
    await db.execute("""
    INSERT INTO highscore(score,total) values(0,"totalscore_ht")
    """);

    for (final row in quiz().datavar_gk) {
      await db.insert(_tablename, row);
    }
    for (final row in quiz().datavar_ts) {
      await db.insert("question_ts", row);
    }

    for (final row in quiz().datavar_sq) {
      await db.insert("question_sq", row);
    }

    for (final row in quiz().datavar_ap) {
      await db.insert("question_ap", row);
    }
    for (final row in quiz().datavar_ht) {
      await db.insert("question_ht", row);
    }

    // await db?.close();
  }

  Future<Map<String, dynamic>?> getquestion_gk() async {
    Database? db = await gamedatabase;
    final results = await db?.rawQuery("""
    SELECT * from $_tablename WHERE id=(SELECT id FROM test WHERE name= 'finalvalue_gk')
    """);
    await db!.close();
    return results?.first;
  }

  Future<Map<String, dynamic>?> getquestion_ht() async {
    Database? db = await gamedatabase;
    final results = await db?.rawQuery("""
    SELECT * from question_ht WHERE id=(SELECT id FROM test WHERE name= 'finalvalue_ht')
    """);
    await db!.close();
    return results?.first;
  }

  Future<Map<String, dynamic>?> getquestion_ts() async {
    Database? db = await gamedatabase;
    final results = await db?.rawQuery("""
    SELECT * from question_ts WHERE id=(SELECT id FROM test WHERE name= 'finalvalue_ts')
    """);
    await db!.close();
    return results?.first;
  }

  Future<Map<String, dynamic>?> getquestion_sq() async {
    Database? db = await gamedatabase;
    final results = await db?.rawQuery("""
    SELECT * from question_sq WHERE id=(SELECT id FROM test WHERE name= 'finalvalue_sq')
    """);
    await db!.close();
    return results?.first;
  }

  Future<Map<String, dynamic>?> getquestion_ap() async {
    Database? db = await gamedatabase;
    final results = await db?.rawQuery("""
    SELECT * from question_ap WHERE id=(SELECT id FROM test WHERE name= 'finalvalue_ap')
    """);
    await db!.close();
    return results?.first;
  }

  Future updateid(int value, String name) async {
    Database? db = await gamedatabase;
    await db?.rawQuery("""
    UPDATE test
    SET id=$value
    WHERE name='$name'
    """);
    await db?.close();
  }

  Future<Map<String, dynamic>?> readint(String name) async {
    Database? db = await gamedatabase;
    final results = await db?.rawQuery("""
    select * from test where name='$name'  """);
    await db?.close();
    return results?.first;
  }

  Future<Map<String, dynamic>?> highscore(String name) async {
    Database? db = await gamedatabase;
    final results = await db?.rawQuery("""
    select * from highscore WHERE total='$name'   """);
    await db?.close();
    return results?.first;
  }

  Future<Map<String, dynamic>?> score(String name) async {
    Database? db = await gamedatabase;
    final results = await db?.rawQuery("""
    select * from highscore WHERE total='$name'   """);
    await db?.close();
    return results?.first;
  }

  Future updatescore(int value, String name) async {
    Database? db = await gamedatabase;
    await db?.rawQuery("""
    UPDATE highscore
    SET score=$value
    WHERE total='$name'
    """);
    await db?.close();
  }

  Future updatehighscore(int value, String name) async {
    Database? db = await gamedatabase;
    await db?.rawQuery("""
    UPDATE highscore
    SET score=$value
    WHERE total='$name'
    """);
    await db?.close();
  }
}
