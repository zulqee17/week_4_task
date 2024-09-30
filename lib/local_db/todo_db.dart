import 'package:hive/hive.dart';
part 'todo_db.g.dart';


@HiveType(typeId:0)
class TodoDb extends HiveObject{
  @HiveField(0)
  dynamic key;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String description;
  @HiveField(3)
  bool isCompleted=false;
}