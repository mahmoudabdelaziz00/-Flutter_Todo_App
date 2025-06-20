import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../data/models/note_model.dart';

class CustomNoteItem extends StatelessWidget {
  final NoteModel note;

  const CustomNoteItem({super.key, required this.note});

  void toggleStatus() {
    FirebaseFirestore.instance.collection('notes').doc(note.id).update({
      'isDone': !note.isDone,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.subTitle),
        trailing: Icon(
          note.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
          color: note.isDone ? Colors.green : Colors.grey,
        ),
        onTap: toggleStatus,
      ),
    );
  }
}
