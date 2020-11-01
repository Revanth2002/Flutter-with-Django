

import 'package:flutter/material.dart';
import 'package:flutterpython/api.dart';
import 'package:flutterpython/models/todo.dart';
import 'package:provider/provider.dart';

class addTodoScreen extends StatefulWidget {
  @override
  _addTodoScreenState createState() => _addTodoScreenState();
}

class _addTodoScreenState extends State<addTodoScreen> {
  final title = TextEditingController();
  final description = TextEditingController();

  void onAdd(){
    final String textvalue = title.text;
    final String descvalue = description.text;
    if(textvalue.isNotEmpty && descvalue.isNotEmpty){
      final Todo todo = Todo(
        title: textvalue,
        description: descvalue
      );
      Provider.of<TodoProvider>(context,listen: false).addTodo(todo);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Add a Todo"),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: TextField(
                   controller: title,
                    decoration: InputDecoration(
                      hintText: "Title ",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusColor: Colors.black,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: TextFormField(
                    controller: description,
                    decoration: InputDecoration(
                      hintText: "Description ",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusColor: Colors.black,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: RaisedButton(onPressed: (){onAdd();
                   Navigator.of(context).pop();
                   },
                    elevation: 10,
                    color: Colors.deepPurple,
                    splashColor: Colors.black,
                    child: Text("Add ",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
