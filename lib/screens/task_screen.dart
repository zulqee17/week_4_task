import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:week_four_task_ip/local_db/todo_db.dart';
import 'package:week_four_task_ip/local_db/todo_db_box.dart';
import 'package:week_four_task_ip/screens/ad_task_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool isEdit = false;
  final todoNotes = TodoDbBox.getTodoData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Screen'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  isEdit = !isEdit;
                });
              },
              child: Text(
                isEdit ? 'done' : 'edit',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ValueListenableBuilder<Box<TodoDb>>(
                  valueListenable: todoNotes.listenable(),
                  builder: (context, box, _) {
                    List<TodoDb> taskList = box.values.toList().cast<TodoDb>();
                    return ListView.builder(
                        itemCount: taskList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdTaskScreen(
                                      todoDb: taskList[index],
                                    ),
                                  ),
                                );
                              },
                              leading: isEdit
                                  ? Checkbox(
                                      value: taskList[index].isCompleted,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          taskList[index].isCompleted = value!;
                                          // below .save is use to save the updated status in hive
                                          taskList[index].save();
                                        });
                                      })
                                  : null,
                              title: Text(
                                taskList[index].title.toString(),
                                style: taskList[index].isCompleted?const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.green
                                ):const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )
                              ),
                              subtitle: Text(taskList[index].description.toString(),
                                      style: taskList[index].isCompleted?const TextStyle(
                                          fontSize: 15,
                                          color: Colors.green
                                      ):const TextStyle(
                                        fontSize: 15,
                                      ),
                                  ),

                              trailing: isEdit
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          todoNotes.delete(
                                              taskList[index].key.toString());
                                        });
                                      },
                                      child: const Icon(Icons.delete),
                                    )
                                  : const SizedBox(),
                            ),
                          );
                        });
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdTaskScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
