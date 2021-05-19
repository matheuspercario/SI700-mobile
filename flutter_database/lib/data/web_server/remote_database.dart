import 'package:dio/dio.dart';
import 'package:flutter_database/model/note.dart';

class DatabaseRemoteServer {
  /**
   * Criando Singleton
   */
  static DatabaseRemoteServer helper = DatabaseRemoteServer._createInstance();

  DatabaseRemoteServer._createInstance();

  String databaseUrl = "http://127.0.0.1:3000/notes";

  Dio _dio = Dio();

  Future<int> insertNote(Note note) async {}

  Future<List<dynamic>> getNoteList() async {
    Response response = await _dio.request(
      this.databaseUrl,
      options: Options(
        method: "GET",
        headers: {
          "Accept": "application/json",
        },
      ),
    );

    List<Note> noteList = [];
    List<int> idList = [];

    response.data.forEach(
      (element) {
        element["dataLocation"] = 2;
        Note note = Note.fromMap(element);
        noteList.add(note);
        idList.add(element["id"]);
      },
    );

    return [noteList, idList];
  }

  Future<int> updateNote(int noteId, Note note) async {}

  deleteNote(int noteId) async {}
}

// TESTES
void main() async {
  DatabaseRemoteServer noteService = DatabaseRemoteServer.helper;
  var response = await noteService.getNoteList();
  Note note = response[0][1];
  print(note.title);
}
