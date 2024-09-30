import 'package:flutter/material.dart';
import 'package:week_four_task_ip/local_db/todo_db.dart';
import 'package:week_four_task_ip/local_db/todo_db_box.dart';
import 'package:week_four_task_ip/utils/utils.dart';

class AdTaskScreen extends StatefulWidget {
  final TodoDb? todoDb;
  AdTaskScreen({Key? key, this.todoDb}) : super(key: key);

  @override
  State<AdTaskScreen> createState() => _AdTaskScreenState();
}

class _AdTaskScreenState extends State<AdTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final todoNotes = TodoDbBox.getTodoData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.todoDb != null) {
      titleController.text = widget.todoDb!.title.toString();
      descriptionController.text = widget.todoDb!.description.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.todoDb != null ? 'Update task Screen' : 'Add task Screen'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: 'enter title',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: 'enter description',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                String title = titleController.text.toString();
                String description = descriptionController.text.toString();
                dynamic key = widget.todoDb != null
                    ? widget.todoDb!.key.toString()
                    : TodoDbBox.genNewKey().toString();

                TodoDb todoData=TodoDb()
                ..key=key
                ..title=title
                ..description=description
                ..isCompleted=false;

                todoNotes.put(key, todoData).then((value){
                  Utils.toastMessage(widget.todoDb!=null?'data updated successfully':'data added successfully', Colors.green);
                }).onError((error,stackError){
                  Utils.toastMessage('error :${error.toString()}', Colors.red);
                });
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: Center(
                    child: Text(
                        widget.todoDb != null ? 'Update Task' : 'Add Task')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
