import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/note_model.dart';
import '../../manager/cubits/notes_cubit/notes_cubit.dart';
import '../../manager/cubits/notes_cubit/notes_state.dart';
import 'custom_notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesLoaded) {
          final List<NoteModel> notes = state.notes;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return CustomNoteItem(note: notes[index]);
            },
          );
        } else if (state is NotesFailure) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
