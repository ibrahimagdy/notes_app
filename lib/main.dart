import 'package:flutter/material.dart';
import 'package:notes_app/view/notes_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotesView(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }

}