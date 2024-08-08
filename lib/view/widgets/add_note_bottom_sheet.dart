import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40),
          CustomTextFormField(
            hint: 'Title',
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hint: 'Content',
            maxLines: 5,
          ),
          SizedBox(height: 50),
          CustomButton(),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}


