import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../constants.dart';
import '../../model/note_model.dart';

part 'fetch_note_state.dart';

class FetchNoteCubit extends Cubit<FetchNoteState> {
  FetchNoteCubit() : super(FetchInitial());

  List<NoteModel>? notes;
  fetchNote() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(FetchNoteSuccess());
  }
}
