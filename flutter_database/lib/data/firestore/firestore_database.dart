import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_database/model/note.dart';

class FirestoreRemoteServer {
  static String uid;

  ///
  ///Criando Singlton
  ///
  static FirestoreRemoteServer helper = FirestoreRemoteServer._createInstance();
  FirestoreRemoteServer._createInstance();

  final CollectionReference noteCollection =
      FirebaseFirestore.instance.collection("notes");

  /// Metodo inserir dados usuario
  includeUserData(String uid, String email, int idade, int ra) async {
    await noteCollection.doc(uid).set({
      "email": email,
      "idade": idade,
      "ra": ra,
    });
  }

  // Mapeia os snapshots (documents) em um map
  List _noteListFromSnapshot(QuerySnapshot snapshots) {
    List<Note> noteList = [];
    List<String> idList = [];

    for (var doc in snapshots.docs) {
      Note note = Note.fromMap(doc.data());
      note.dataLocation = 3;
      noteList.add(note);
      idList.add(doc.id);
    }
    return [noteList, idList];
  }

  // GET NOTE LIST
  Future<List<dynamic>> getNoteList() async {
    QuerySnapshot snapshot =
        await noteCollection.doc(uid).collection("my_notes").get();

    // Invocar método auxilar
    return _noteListFromSnapshot(snapshot);
  }

  // INSERT NOTE
  Future<void> insertNote(Note note) async {
    // .add() -> cria o hash_ID automaticamente
    await noteCollection.doc(uid).collection("my_notes").add({
      "title": note.title,
      "description": note.description,
    });
  }

  // UPDATE NOTE
  Future<void> updateNote(String noteId, Note note) async {
    await noteCollection
        .doc(uid)
        .collection("my_notes")
        .doc("$noteId")
        .update({"title": note.title, "description": note.description});
  }

  // DELETE NOTE
  Future<void> deleteNote(String noteId) async {
    await noteCollection
        .doc(uid)
        .collection("my_notes")
        .doc("$noteId")
        .delete();
  }

  ///
  /// STREAM
  ///
  Stream get stream {
    // Snapshots = conjuntos de ducomentos
    return noteCollection
        .doc(uid)
        .collection("my_notes")
        .snapshots()
        .map(_noteListFromSnapshot);
  }
}
