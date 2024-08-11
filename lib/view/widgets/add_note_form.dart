import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/view/widgets/colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title, content;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void saveNote(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final String formattedDate = DateFormat('dd/MM/yyyy – kk:mm').format(DateTime.now());

      final NoteModel note = NoteModel(
        title: title!,
        content: content!,
        date: formattedDate,
        color: const Color(0xffffb100).value,
      );

      BlocProvider.of<AddNoteCubit>(context).addNote(note);
    } else {
      autoValidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void showAddingNoteMessage(String message, {required bool isSuccess}) {
    final snackBar = SnackBar(
      content: Center(child: Text(message, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
      backgroundColor: isSuccess ? const Color(0xff00ff0d) : Colors.red,

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }



  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNoteCubit,AddNoteState>(
      listener: (context, state) {
      if (state is AddNoteSuccess) {
        showAddingNoteMessage('Note added successfully!', isSuccess: true);
      } else if (state is AddNoteFailure) {
        showAddingNoteMessage('Failed to add note. Please try again.', isSuccess: false);
      }
      },
      child: BlocBuilder<AddNoteCubit, AddNoteState>(
        builder: (context, state) {
          bool isLoading = state is AddNoteLoading;
          return AbsorbPointer(
            absorbing: isLoading,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  CustomTextFormField(
                    hint: 'Title',
                    onSaved: (value) {
                      title = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    hint: 'Content',
                    maxLines: 5,
                    onSaved: (value) {
                      content = value;
                    },
                  ),
                  const SizedBox(height: 30),
                  const ColorsListView(),
                  const SizedBox(height: 30),
                  CustomButton(
                    isLoading: isLoading,
                    onTap: () {
                      saveNote(context);
                    },
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
