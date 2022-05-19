import 'package:flutter/material.dart';
import 'package:todo/screens/add_todo_screen.dart';
import 'package:todo/screens/todo_list_screen.dart';

class RouteGenerator {
  static MaterialPageRoute? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case ('/'):
        return MaterialPageRoute(builder: (_) => TodoListScreen());
      case ('/add_todo'):
        return MaterialPageRoute(builder: (_) => AddTodoScreen());
      default:
        return null;
    }
  }
}
