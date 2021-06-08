import 'dart:async';
import 'package:flutter_database/data/firestore/firestore_database.dart';
import 'package:flutter_database/data/local/local_database.dart';
import 'package:flutter_database/data/remote/remote_database.dart';
import 'package:flutter_database/logic/monitor_db/monitor_db_event.dart';
import 'package:flutter_database/logic/monitor_db/monitor_db_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_database/model/note.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  StreamSubscription _localSubscription;
  StreamSubscription _remoteSubscription;
  StreamSubscription _firestoreSubscription;

  List<Note> localNoteList;
  List<Note> remoteNoteList;
  List<Note> firestoreNoteList;
  List<int> localIdList;
  List<int> remoteIdList;
  List<String> firestoreIdList;

  MonitorBloc() : super(MonitorState(noteList: [], idList: [])) {
    add(AskNewList());

    _localSubscription = DatabaseLocalServer.helper.stream.listen((response) {
      try {
        localNoteList = response[0];
        localIdList = response[1];
        add(
          UpdateList(
            noteList: List.from(localNoteList)
              ..addAll(remoteNoteList)
              ..addAll(firestoreNoteList),
            idList: List.from(localIdList)
              ..addAll(remoteIdList)
              ..addAll(firestoreIdList),
          ),
        );
      } catch (e) {}
    });

    _remoteSubscription = DatabaseRemoteServer.helper.stream.listen((response) {
      try {
        remoteNoteList = response[0];
        remoteIdList = response[1];
        add(UpdateList(
          noteList: List.from(localNoteList)
            ..addAll(remoteNoteList)
            ..addAll(firestoreNoteList),
          idList: List.from(localIdList)
            ..addAll(remoteIdList)
            ..addAll(firestoreIdList),
        ));
      } catch (e) {}
    });

    _firestoreSubscription =
        FirestoreRemoteServer.helper.stream.listen((response) {
      try {
        firestoreNoteList = response[0];
        firestoreIdList = response[1];

        add(UpdateList(
          noteList: List.from(localNoteList)
            ..addAll(remoteNoteList)
            ..addAll(firestoreNoteList),
          idList: List.from(localIdList)
            ..addAll(remoteIdList)
            ..addAll(firestoreIdList),
        ));
      } catch (e) {}
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      // Ir ao BD Local pedir novos dados
      var localResponse = await DatabaseLocalServer.helper.getNoteList();
      // Ir ao Servidor pedir novos dados
      var remoteResponse = await DatabaseRemoteServer.helper.getNoteList();
      // Ir ao Firebase pedir novos dados
      var firestoreResponse = await FirestoreRemoteServer.helper.getNoteList();

      // response local
      localNoteList = localResponse[0];
      localIdList = localResponse[1];

      // response remote
      remoteNoteList = remoteResponse[0];
      remoteIdList = remoteResponse[1];

      // response firestore
      firestoreNoteList = firestoreResponse[0];
      firestoreIdList = firestoreResponse[1];

      yield MonitorState(
        noteList: List.from(localNoteList)
          ..addAll(remoteNoteList)
          ..addAll(firestoreNoteList),
        idList: List.from(localIdList)
          ..addAll(remoteIdList)
          ..addAll(firestoreIdList),
      );
    } else if (event is UpdateList) {
      yield MonitorState(idList: event.idList, noteList: event.noteList);
    }
  }

  close() {
    _localSubscription.cancel();
    _remoteSubscription.cancel();
    _firestoreSubscription.cancel();
    return super.close();
  }
}
