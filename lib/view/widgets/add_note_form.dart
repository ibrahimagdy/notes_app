import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/view/widgets/color_item.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
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
                ColorsListView(),
                const SizedBox(height: 30),
                CustomButton(
                  isLoading: isLoading,
                  onTap: () {
                    var currentDate = DateTime.now();
                    String formattedDate = DateFormat('dd/MM/yyyy – kk:mm').format(currentDate);
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      NoteModel note = NoteModel(
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
                  },
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
        );
      },
    );
  }
}
