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
                      tasks.add({
                        "id": DateTime.now().millisecondsSinceEpoch,
                        "title": txtTitle.text,
                        "isCompleted": false
                      });
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
