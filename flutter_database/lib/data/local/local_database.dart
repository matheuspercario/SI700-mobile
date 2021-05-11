import 'dart:async';
import 'dart:io';

import 'package:flutter_database/model/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLocalServer {
  /**
   * Criando Singletion
   * 
   * Apenas um objeto da classe pode ser instanciado, ou seja, ela sabe tudo o que acontecerá no DB.
   */
  static DatabaseLocalServer helper = DatabaseLocalServer._createInstance();
  DatabaseLocalServer._createInstance();

  static Database _database;
  String noteTable = "note_table";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Salvar DB na memoria interna
    Directory directory = await getApplicationDocumentsDirectory();
    // Nome e caminho do Arquivo SQLite
    String path = directory.path + "note.db";

    Database notesDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return notesDatabase;
  }

  //  CREATE TABLE DB
  _createDb(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $noteTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT)",
    );
  }

  // INSERT ON DB
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    int result = await db.insert(noteTable, note.toMap());
    notify();
    return result;
  }

  // QUERY: Retorna tudo que tem no banco.
  getNoteList() async {
    Database db = await this.database;
    var noteMapList = await db.rawQuery("SELECT * FROM $noteTable");
    List<Note> noteList = [];
    List<int> idList = [];
    for (int i = 0; i < noteMapList.length; i++) {
      Note note = Note.fromMap(noteMapList[i]);
      note.dataLocation = 1;
      noteList.add(note);
      idList.add(noteMapList[i]["id"]);
    }
    return [noteList, idList];
  }

  // UPDATE
  Future<int> updateNote(int noteId, Note note) async {
    Database db = await this.database;
    var result = await db.update(
      noteTable,
      note.toMap(),
      where: "$colId = ?",
      whereArgs: [noteId],
    );
    notify();
    return result; // Num linhas afetadas
  }

  // DELETE
  deleteNote(int noteId) async {
    Database db = await this.database;
    int result = await db.rawDelete(
      "DELETE FROM $noteTable WHERE $colId=$noteId",
    );
    notify();
    return result;
  }

  /**
   * STREAM -> Notifica quem quiser ouvir
   */

  notify() async {
    if (_controller != null) {
      var response = await getNoteList();
      _controller.sink.add(response);
    }
  }

  Stream get stream {
    if (_controller == null) {
      _controller = StreamController();
    }
    return _controller.stream.asBroadcastStream();
  }

  dispose() {
    if (!_controller.hasListener) {
      _controller.close();
      _controller = null;
    }
  }

  static StreamController _controller;
}
