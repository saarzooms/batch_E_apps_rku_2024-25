import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List tasks = [
    {"id": 123456, "title": "Buy iPhone", "isCompleted": false}
  ];
  int selId = 0;
  TextEditingController txtTitle = TextEditingController();
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
                        tasks.add({
                          "id": DateTime.now().millisecondsSinceEpoch,
                          "title": txtTitle.text,
                          "isCompleted": false
                        });
                      } else {
                        var idx = tasks
                            .indexWhere((element) => element['id'] == selId);
                        var task = tasks[idx];
                        task['title'] = txtTitle.text;
                        tasks.removeAt(idx);
                        tasks.insert(idx, task);
                        selId = 0;
                      }

                      txtTitle.clear();
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            //to display the list
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) => CheckboxListTile(
                  onChanged: (v) {
                    tasks[index]["isCompleted"] = v;
                    setState(() {});
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  value: tasks[index]["isCompleted"],
                  title: Text(
                    "${tasks[index]["title"]} ${tasks[index]["id"]}",
                    style: TextStyle(
                      decoration: tasks[index]["isCompleted"]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: tasks[index]["isCompleted"]
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  secondary: SizedBox(
                    width: 80,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            //logic for edit
                            txtTitle.text = tasks[index]["title"];
                            selId = tasks[index]["id"];
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
              ),
            )
          ],
        ));
  }
}
