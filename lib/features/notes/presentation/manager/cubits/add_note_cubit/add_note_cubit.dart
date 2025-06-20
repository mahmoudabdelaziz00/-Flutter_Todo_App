import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/note_model.dart';
import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Future<void> addNote(NoteModel note) async {
    emit(AddNoteLoading());
    print("addNote called!");
    try {
      await FirebaseFirestore.instance.collection('notes').add(note.toMap());
      emit(AddNoteSuccess());
      print("Note added to Firebase!");
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
      print("Error: $e");
    }
  }
}
