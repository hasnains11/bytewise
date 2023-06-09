import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final VoidCallback onRemove;
  final VoidCallback onIsCompleted;

  TodoListItem({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.onRemove,
    required this.onIsCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) => onRemove(),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        leading: Checkbox(
          value: isCompleted,
          onChanged: (value) => onIsCompleted(),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            decoration:
                isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            color: isCompleted ? Colors.grey[400] : Colors.black,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
            decoration:
                isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.remove_circle,
            color: Colors.red,
          ),
          onPressed: onRemove,
        ),
        tileColor: isCompleted ? Colors.grey[200] : Colors.white,
      ),
    );
  }
}
