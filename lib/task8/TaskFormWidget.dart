import 'package:bytewise/task8/todoModel.dart';
import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  final Todo? initialData;

  const TaskForm({Key? key, this.initialData}) : super(key: key);

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      _title = widget.initialData!.title;
      _description = widget.initialData!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: _title,
            decoration: InputDecoration(labelText: 'Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
            onSaved: (value) {
              _title = value!;
            },
          ),
          TextFormField(
            initialValue: _description,
            decoration: InputDecoration(labelText: 'Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
            onSaved: (value) {
              _description = value!;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (widget.initialData == null) {
                  // Add data logic
                } else {
                  // Update data logic
                }
              }
            },
            child: Text(widget.initialData == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }
}
