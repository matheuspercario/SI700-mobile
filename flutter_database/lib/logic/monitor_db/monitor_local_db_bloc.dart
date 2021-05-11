import 'dart:async';
import 'package:flutter_database/data/local/local_database.dart';
import 'package:flutter_database/logic/monitor_db/monitor_db_event.dart';
import 'package:flutter_database/logic/monitor_db/monitor_db_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_database/model/note.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  StreamSubscription _localSubscription;
  MonitorBloc() : super(MonitorState(noteList: [], idList: [])) {
    add(AskNewList());
    _localSubscription = DatabaseLocalServer.helper.stream.listen((response) {
      try {
        List<Note> localNoteList = response[0];
        List<int> localIdList = response[1];
        add(UpdateList(noteList: localNoteList, idList: localIdList));
      } catch (e) {}
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      // Ir ao BD
      var response = await DatabaseLocalServer.helper.getNoteList();
      List<Note> localNoteList = response[0];
      List<int> localIdList = response[1];
      yield MonitorState(idList: localIdList, noteList: localNoteList);
    } else if (event is UpdateList) {
      yield MonitorState(idList: event.idList, noteList: event.noteList);
    }
  }

  close() {
    _localSubscription.cancel();
    return super.close();
  }
}
