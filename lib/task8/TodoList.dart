import 'dart:async';

import 'package:bytewise/task8/TodoListItem.dart';
import 'package:bytewise/task8/database.dart';
import 'package:bytewise/task8/todoModel.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  late StreamController<List<Todo>> _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<List<Todo>>();
    loadTodos();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var todos = snapshot.data as List;
            if (todos.isEmpty) {
              return Center(
                child: Text('No Todos'),
              );
            }
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoListItem(
                  title: todos[index].title,
                  description: todos[index].description,
                  isCompleted: todos[index].isCompleted,
                  onIsCompleted: () async {
                    await DatabaseHelper().update(
                      'todos',
                      {
                        'isCompleted': !todos[index].isCompleted,
                      },
                      'id= ? ',
                      [todos[index].did],
                    );
                    loadTodos();
                  },
                  onRemove: () async {
                    await DatabaseHelper()
                        .delete('todos', 'id= ? ', [todos[index].did]);
                    loadTodos();
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void loadTodos() async {
    await DatabaseHelper().queryAll('todos').then((todos) {
      final List<Todo> todoslist = List.generate(
        todos.length,
        (i) {
          return Todo.fromMap(todos[i]);
        },
      );
      _streamController.sink.add(todoslist);
    });
  }
}
