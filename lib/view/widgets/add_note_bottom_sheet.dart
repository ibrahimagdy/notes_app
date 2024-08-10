import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubit/fetch_note_cubit/fetch_note_cubit.dart';
import 'package:notes_app/view/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print(state.errMessage);
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<FetchNoteCubit>(context).fetchNote();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const SingleChildScrollView(
              child: AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
