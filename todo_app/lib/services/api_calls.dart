import 'dart:convert';

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

  static addTask(Map data) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/'));
    request.body = json.encode(data);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
