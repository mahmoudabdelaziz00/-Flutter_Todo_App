import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/note_model.dart';
import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  void fetchAllNotes() {
    FirebaseFirestore.instance
        .collection('notes')
        .orderBy('title')
        .snapshots()
        .listen((snapshot) {
          List<NoteModel> notes =
              snapshot.docs.map((doc) {
                return NoteModel.fromDocument(doc.id, doc.data());
              }).toList();

          emit(NotesLoaded(notes));
        });
  }
}
