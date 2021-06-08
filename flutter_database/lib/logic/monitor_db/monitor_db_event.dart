import 'package:flutter_database/model/note.dart';

abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {
  List<Note> noteList;
  List<dynamic> idList;
  UpdateList({this.noteList, this.idList});
}
