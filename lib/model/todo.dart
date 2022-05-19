import 'package:hive_flutter/hive_flutter.dart';
part "todo.g.dart";

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  Todo({required this.title, required this.description});
}
