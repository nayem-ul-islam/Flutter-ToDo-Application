class Task {
  final int id;
  final String title;
  final String description;

  Task({required this.description, required this.id, required this.title});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
