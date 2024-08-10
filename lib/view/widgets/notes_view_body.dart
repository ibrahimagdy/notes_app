import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/fetch_note_cubit/fetch_note_cubit.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<FetchNoteCubit>(context).fetchNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Notes',
              icon: Icons.search,
            ),
            Expanded(
              child: NotesListView(),
            ),
          ],
        ),
      ),
    );
  }
}
