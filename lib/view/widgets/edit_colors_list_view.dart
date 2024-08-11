import 'package:flutter/material.dart';
import 'package:notes_app/model/note_model.dart';
import '../../constants.dart';
import 'color_item.dart';

class EditColorsListView extends StatefulWidget{
  final NoteModel note;
  const EditColorsListView({super.key, required this.note});

  @override
  State<EditColorsListView> createState() => _EditColorsListViewState();
}

class _EditColorsListViewState extends State<EditColorsListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: (){
                currentIndex = index;
                widget.note.color = colors[index].value;
                setState(() {
                });
              },
              child: ColorItem(
                color: colors[index],
                isSelected: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}