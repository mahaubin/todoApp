import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/boxes.dart';
import 'package:todo/model/todo.dart';

class AddTodoScreen extends StatefulWidget {
  AddTodoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _title = new TextEditingController();
  final TextEditingController _description = new TextEditingController();
  validate() {
    if (_formKey.currentState!.validate() && _formKey.currentState != null) {
      _onFormSubmit();
      print("The form is validate");
    } else {
      print("The form is not validate");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add todo"),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Title",
                    hintText: "Enter the title",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Title can't be empty";
                    }
                  },
                  controller: _title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Descritpion",
                    hintText: "Enter the description",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Description can't be empty";
                    }
                  },
                  controller: _description,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                    padding: EdgeInsets.only(
                        left: 25, right: 25, top: 15, bottom: 15),
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.red,
                    onPressed: () {
                      validate();
                    }),
              )
            ],
          )),
    );
  }

  void _onFormSubmit() {
    Box<Todo> todoBox = Hive.box<Todo>(HiveBoxes.todo);
    todoBox.add(Todo(title: _title.text, description: _description.text));
    Navigator.of(context).pop();
    print(todoBox);
  }
}
