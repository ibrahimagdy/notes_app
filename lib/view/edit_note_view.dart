import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/custom_app_bar.dart';
import 'package:notes_app/view/widgets/custom_text_form_field.dart';

class EditNoteView extends StatelessWidget{
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Edit Note',
                icon: Icons.check,
              ),
              SizedBox(height: 50),
              CustomTextFormField(
                hint: 'Title',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hint: 'Content',
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

}