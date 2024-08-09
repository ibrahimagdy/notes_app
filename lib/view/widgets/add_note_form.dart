import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget{
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
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 40),
          CustomTextFormField(
            hint: 'Title',
            onSaved: (value){
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hint: 'Content',
            maxLines: 5,
            onSaved: (value){
              content = value;
            },
          ),
          const SizedBox(height: 50),
          CustomButton(
            onTap: (){
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
              }
              else{
                autoValidateMode = AutovalidateMode.always;
                setState(() {
                });
              }
            },
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}