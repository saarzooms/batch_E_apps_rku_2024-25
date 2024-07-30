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
                        "id": 123456,
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
                  onChanged: (v) {},
                  controlAffinity: ListTileControlAffinity.leading,
                  value: tasks[index]["isCompleted"],
                  title: Text(tasks[index]["title"]),
                  secondary: SizedBox(
                    width: 80,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {},
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
