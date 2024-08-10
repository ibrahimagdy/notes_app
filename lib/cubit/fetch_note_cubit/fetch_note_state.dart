part of 'fetch_note_cubit.dart';

@immutable
sealed class FetchNoteState {}

final class FetchInitial extends FetchNoteState {}

final class FetchNoteSuccess extends FetchNoteState {}
