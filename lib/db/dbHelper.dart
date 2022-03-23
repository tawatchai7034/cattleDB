import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/catPro.dart';
import '../models/catTime.dart';
import '../models/catImage.dart';

class CattleDB {
  static final CattleDB instance = CattleDB._init();

  static Database? _database;

  CattleDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('cattle.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  FutureOr<void> _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final doubleType = 'REAL NOT NULL';

    await db.execute(''' CREATE TABLE $tableCatPro (
          ${CatProFields.id} $integerType,
          ${CatProFields.name} $textType,
          ${CatProFields.gender} $boolType,
          ${CatProFields.species} $textType,
    )''');

    await db.execute(''' CREATE TABLE $tableCatTime (
          ${CatTimeFields.id} $integerType,
          ${CatTimeFields.idCatPro} $integerType,
          ${CatTimeFields.bodyLenght} $doubleType,
          ${CatTimeFields.heartGirth} $doubleType,
          ${CatTimeFields.hearLenghtSide} $doubleType,
          ${CatTimeFields.hearLenghtRear} $doubleType,
          ${CatTimeFields.hearLenghtTop} $doubleType,
          ${CatTimeFields.pixelReference} $doubleType,
          ${CatTimeFields.distanceReference} $doubleType,
          ${CatTimeFields.imageSide} $integerType,
          ${CatTimeFields.imageRear} $integerType,
          ${CatTimeFields.imageTop} $integerType,
          ${CatTimeFields.date} $textType,
          ${CatTimeFields.note} $textType,
    )''');

    await db.execute(''' CREATE TABLE $tableCatImage (
          ${CatImageFields.id} $integerType,
          ${CatImageFields.idCatPro} $integerType,
          ${CatImageFields.idCatTime} $integerType,
          ${CatImageFields.imagePath} $textType,
    )''');
  }

  Future<CatPro> createCatPro(CatPro catPro) async {
    final db = await instance.database;

    final id = await db.insert(tableCatPro, catPro.toJson());
    return catPro.copy(id: id);
  }

  Future<CatTime> createCatTime(CatTime catTime) async {
    final db = await instance.database;

    final id = await db.insert(tableCatTime, catTime.toJson());
    return catTime.copy(id: id);
  }

  Future<CatImage> createCatImage(CatImage catImage) async {
    final db = await instance.database;

    final id = await db.insert(tableCatTime, catImage.toJson());
    return catImage.copy(id: id);
  }

    Future<List<CatPro>> readAllCatPro() async {
    final db = await instance.database;

    final orderBy = '${CatProFields.species} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableCatPro, orderBy: orderBy);

    return result.map((json) => CatPro.fromJson(json)).toList();
  }

  Future<List<CatTime>> readAllCatTime() async {
    final db = await instance.database;

    final orderBy = '${CatTimeFields.date} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableCatPro, orderBy: orderBy);

    return result.map((json) => CatTime.fromJson(json)).toList();
  }

}
