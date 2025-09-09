class Todo {
  final String id;
  final String title;
  final String description;
  final String category; // contoh: sekolah, pekerjaan, pribadi
  final bool isDone;
  final DateTime createdAt;
  final DateTime? completedAt;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    required this.createdAt,
    this.completedAt,
  });

  /// copyWith untuk update data (misalnya toggle done)
  Todo copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    bool? isDone,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt,
    );
  }
}
