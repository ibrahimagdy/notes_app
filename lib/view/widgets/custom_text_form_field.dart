import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  const CustomTextFormField({super.key, required this.hint, this.maxLines = 1, this.onSaved, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Field is required';
        }
        else{
          return null;
        }
      },
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
        hintText: hint,
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
