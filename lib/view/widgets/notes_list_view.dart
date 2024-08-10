import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/fetch_note_cubit/fetch_note_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNoteCubit, FetchNoteState>(
      builder: (context, state) {
        List<NoteModel> note = BlocProvider.of<FetchNoteCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ListView.builder(
            itemCount: note.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: CustomNoteItem(
                  note: note[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
