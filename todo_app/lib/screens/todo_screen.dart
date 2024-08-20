import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../services/api_calls.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> tasks = [];
  int selId = 0;
  TextEditingController txtTitle = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    tasks = await APICalls.fetchTasks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        body: Column(
          children: [
            //to add/update
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: txtTitle,
                    decoration: InputDecoration(hintText: 'Enter task name'),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //todo add logic to add/update task
                    if (txtTitle.text.isNotEmpty) {
                      if (selId == 0) {
                        APICalls.addTask({
                          "id": DateTime.now().millisecondsSinceEpoch,
                          "task": txtTitle.text
                        });
                        // tasks.add(Todo(
                        //     id: DateTime.now().millisecondsSinceEpoch,
                        //     task: txtTitle.text,
                        //     completed: false));
                      } else {
                        var idx =
                            tasks.indexWhere((element) => element.id == selId);
                        var task = tasks[idx];
                        task.task = txtTitle.text;
                        tasks.removeAt(idx);
                        tasks.insert(idx, task);
                        selId = 0;
                      }

                      txtTitle.clear();
                    }
                    setState(() {});
                    fetchData();
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            //to display the list
            Expanded(
              child: tasks.isNotEmpty
                  ? ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) => CheckboxListTile(
                        onChanged: (v) {
                          tasks[index].completed = v;
                          setState(() {});
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        value: tasks[index].completed,
                        title: Text(
                          "${tasks[index].task} ${tasks[index].id}",
                          style: TextStyle(
                            decoration: tasks[index].completed!
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: tasks[index].completed!
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                        secondary: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  //logic for edit
                                  txtTitle.text = tasks[index].task!;
                                  selId = tasks[index].id!;
                                  setState(() {});
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  //logic for delete
                                  tasks.removeAt(index);
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            )
          ],
        ));
  }
}
