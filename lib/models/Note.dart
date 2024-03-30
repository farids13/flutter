class Note {
  final String id, title, note;
  final DateTime createdAt;

  Note({
    required this.id,
    required this.title,
    required this.note,
    required this.createdAt,
  });
}

List<Note> notes = [
  Note(
    id: '1',
    title: 'Note 1',
    note: 'lorem ipsum dolor sit amet',
    createdAt: DateTime.now(),
  ),
  Note(
    id: '2',
    title: 'Note 2',
    note: 'This is note 2',
    createdAt: DateTime.now(),
  ),
];
