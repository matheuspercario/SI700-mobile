import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_database/data/remote/remote_database.dart';
import 'package:flutter_database/logic/manage_db/manage_db_event.dart';
import 'package:flutter_database/logic/manage_db/manage_db_state.dart';

class ManageRemoteBloc extends Bloc<ManageEvent, ManageState> {
  ManageRemoteBloc() : super(InsertState());

  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is DeleteEvent) {
      DatabaseRemoteServer.helper.deleteNote(event.noteId);
    } else if (event is UpdateRequest) {
      yield UpdateState(noteId: event.noteId, previousNote: event.previousNote);
    } else if (event is UpdateCancel) {
      yield InsertState();
    } else if (event is SubmitEvent) {
      if (state is InsertState) {
        DatabaseRemoteServer.helper.insertNote(event.note);
      } else if (state is UpdateState) {
        UpdateState updateState = state;
        DatabaseRemoteServer.helper.updateNote(updateState.noteId, event.note);
        yield InsertState();
      }
    }
  }
}
