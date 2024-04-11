final String tableNotes = 'notes';

class NoteModel {
  static final String id = 'id';
  static final String title = 'title';
  static final String note = 'note';
  static final String createdAt = 'created_at';

  static final List<String> values = [
    id,
    title,
    note,
    createdAt,
  ];
}

class Note {
  final int? id;
  final String title;
  final String note;
  final DateTime createdAt;

  const Note({
    this.id,
    required this.title,
    required this.note,
    required this.createdAt,
  });

  Note copy({
    int? id,
    String? title,
    String? note,
    DateTime? createdAt,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteModel.id] as int,
        title: json[NoteModel.title] as String,
        note: json[NoteModel.note] as String,
        createdAt: DateTime.parse(json[NoteModel.createdAt] as String),
      );

  Map<String, Object?> toJson() => {
        NoteModel.id: id,
        NoteModel.title: title,
        NoteModel.note: note,
        NoteModel.createdAt: createdAt.toIso8601String(),
      };
}
