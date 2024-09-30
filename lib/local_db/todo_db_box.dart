

import 'package:hive_flutter/adapters.dart';
import 'package:week_four_task_ip/local_db/todo_db.dart';

class TodoDbBox{
  static final todoDbNoteKeeper='todoDbNoteKeeper';

  static String genNewKey(){
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  static getHiveInitFunction()async{
    await Hive.initFlutter();
    if(!Hive.isAdapterRegistered(0)){
      Hive.registerAdapter(TodoDbAdapter());
    }
    
    if(!Hive.isBoxOpen(todoDbNoteKeeper)){
      await Hive.openBox<TodoDb>(todoDbNoteKeeper);
    }
  }

  static Box<TodoDb> getTodoData(){
    return Hive.box(todoDbNoteKeeper);
  }
}