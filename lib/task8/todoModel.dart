class Todo {
  int? id;
  int? did;
  String title;
  String description;
  bool isCompleted;

  Todo({
    required this.title,
    required this.description,
    required this.isCompleted,
    this.did = 0,
  });

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        did: json['id'],
        title: json['title'],
        description: json['description'],
        isCompleted: json['isCompleted'] == 1 ? true : false,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'isCompleted': isCompleted ? true : false,
      };
}
