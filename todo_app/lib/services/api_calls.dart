import 'package:http/http.dart' as http;

import '../models/todo.dart';

class APICalls {
  static fetchTasks() async {
    List<Todo> todos = [];
    var request = http.Request(
        'GET', Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      print(resp);
      todos = todoFromJson(resp);
    } else {
      print(response.reasonPhrase);
    }
    return todos;
  }
}
