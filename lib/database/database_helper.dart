import 'package:flutter/material.dart';
import 'package:noteapp/model/note_model.dart';

import 'package:sqflite/sqflite.dart' as sql;
import 'dart:async';

class DataBaseHeler {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
      'CREATE TABLE notes ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT,'
      'title STRING, description TEXT,)',
    );
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('drus', version: 1, onCreate: (
      sql.Database database,
      int version,
    ) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(Notes notes) async {
    final db = await DataBaseHeler.db();
    final id = await db.insert('notes', notes.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  ///grt all notes
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DataBaseHeler.db();
    return db.query('notes', orderBy: 'id');
  }

  ///to get single note
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DataBaseHeler.db();
    return db.query('notes', where: 'id =?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
    int id,
    String title,
    String description,
    int isCompleted,
    String date,
    String createdAt,
    String updatedAt,
  ) async {
    final db = await DataBaseHeler.db();
    final data = {
      'title': title,
      'description': description,
    };
    final result =
        await db.update('notes', data, where: 'id =?', whereArgs: [id]);
    return result;
  }

  static Future<void> delete(int id) async {
    final db = await DataBaseHeler.db();
    try {
      db.delete('notes', where: 'id =?', whereArgs: [id]);
    } catch (e) {
      debugPrint('$e');
    }
  }
}
