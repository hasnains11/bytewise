import 'package:bytewise/task8/TodoList.dart';
import 'package:bytewise/task8/database.dart';
import 'package:bytewise/task8/todoModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final GlobalKey<TodoListState> _childKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
          child: TodoList(
        key: _childKey,
      )),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();

    print('showing dialog');
    void callChildMethod() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _childKey.currentState?.loadTodos();
        print(_childKey);
      });
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a Todo'),
          content: Column(
            children: [
              TextField(
                controller: _titleController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Todo Title',
                  hintText: 'E.g. Buy groceries',
                ),
              ),
              TextField(
                controller: _descriptionController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Todo Description',
                  hintText: 'E.g. get groceries at 11am',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () async {
                final String title = _titleController.text;
                final String description = _descriptionController.text;
                Todo todo = Todo(
                  title: title,
                  description: description,
                  isCompleted: false,
                );

                await DatabaseHelper().insert('todos', todo.toMap());
                callChildMethod();
                Navigator.pop(context);
              },
              child: const Text('ADD'),
            ),
          ],
        );
      },
    );
  }
}
