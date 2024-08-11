import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/fetch_note_cubit/fetch_note_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/view/widgets/custom_app_bar.dart';
import 'package:notes_app/view/widgets/custom_text_form_field.dart';
import 'package:notes_app/view/widgets/edit_colors_list_view.dart';

class EditNoteView extends StatefulWidget{
  final NoteModel noteModel;
  const EditNoteView({super.key, required this.noteModel});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title,content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              CustomAppBar(
                onPressed: (){
                  widget.noteModel.title = title ?? widget.noteModel.title;
                  widget.noteModel.content = content ?? widget.noteModel.content;
                  widget.noteModel.save();
                  BlocProvider.of<FetchNoteCubit>(context).fetchNote();
                  Navigator.pop(context);
                },
                title: 'Edit Note',
                icon: Icons.check,
              ),
              const SizedBox(height: 50),
              CustomTextFormField(
                onChanged: (value){
                  title = value;
                },
                hint: widget.noteModel.title,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onChanged: (value){
                  content = value;
                },
                hint: widget.noteModel.content,
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              EditColorsListView(note: widget.noteModel),
            ],
          ),
        ),
      ),
    );
  }
}