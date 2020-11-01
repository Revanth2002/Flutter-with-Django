import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterpython/models/todo.dart';
import 'package:flutterpython/screens/addtodo.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier{
  TodoProvider(){
    this.fetchTask();
  }
  List<Todo> _todo = [];
  List<Todo> get todo{
    return [..._todo];
  }
  void addTodo(Todo todo) async{
    final response = await http.post("http://10.0.2.2:8000/apis/v1/",
      headers: {"Content-Type" : "application/json"},
      body: json.encode(todo),
    );
    if(response.statusCode == 201){
      todo.id = json.decode(response.body)['id'];
      _todo.add(todo);
       notifyListeners();
    }
  }

  void deleteTodo(Todo todo) async{
    final response = await http.delete("http://10.0.2.2:8000/apis/v1/${todo.id}",
    );
    if(response.statusCode == 204){
     _todo.remove(todo);
     notifyListeners();
    }
  }


  fetchTask() async{
    final url = "http://127.0.0.1:8000/apis/v1/?format=json";
    final response = await http.get(url);
    if(response.statusCode == 200){
      var data = json.decode(response.body) as List;
      _todo = data.map<Todo>((json) => Todo.fromJson(json)).toList();
      //notifyListeners();
    }
  }
}