import '../../../../data/models/note_model.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoaded extends NotesState {
  final List<NoteModel> notes;

  NotesLoaded(this.notes);
}

class NotesFailure extends NotesState {
  final String errorMessage;

  NotesFailure(this.errorMessage);
}
