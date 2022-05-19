import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/boxes.dart';
import 'package:todo/screens/add_todo_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/todo.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List todoing"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Todo>(HiveBoxes.todo).listenable(),
        builder: (context, Box<Todo> box, _) {
          if (box.values.isEmpty) {
            return Center(
              child: Text("To do list is empty"),
            );
          }
          return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                Todo? res = box.getAt(index);
                return Dismissible(
                    onDismissed: (direction) {},
                    background: Container(
                      color: Colors.red,
                    ),
                    key: UniqueKey(),
                    child: ListTile(
                      title: Text(res!.title),
                      subtitle: Text(res.description),
                    ));
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/add_todo');
          }),
    );
  }
}
