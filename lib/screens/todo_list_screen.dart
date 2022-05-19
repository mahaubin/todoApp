import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/screens/add_todo_screen.dart';

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
      body: Container(
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Dismissible(
                  onDismissed: (direction) {},
                  background: Container(
                    color: Colors.red,
                  ),
                  key: UniqueKey(),
                  child: ListTile(
                    title: Text("Title"),
                    subtitle: Text("Description"),
                  ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/add_todo');
          }),
    );
  }
}
