

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpython/api.dart';
import 'package:flutterpython/screens/addtodo.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.black,
      image: new Image.network("shorturl.at/oryzD"),
      loaderColor: Colors.white,
      loadingText: Text("Loading"),
      navigateAfterSeconds: new Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(title: Text("Firebase web"),
      ),
      body: Center(
        child: Container(
          child: Text("Firebase web deploy"),
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Python and Flutter : TODO "),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
          onPressed:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> addTodoScreen()));
          } ,
          child: Icon(Icons.add)
      ),
      body: ListView.builder(
          itemCount: todoP.todo.length,
          itemBuilder: (BuildContext context,int index){
            return Column(
              children: [
                ListTile(
                  trailing: IconButton(icon : Icon(Icons.delete,color: Colors.red),
                    onPressed: (){
                    todoP.deleteTodo(todoP.todo[index]);
                    },
                  ),
                  title: Text(todoP.todo[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  subtitle: Text(todoP.todo[index].description,
                    style: TextStyle(color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                ),
                Divider(color: Colors.black,endIndent: 15,indent: 15,thickness: 0.2,)
              ],
            );
          },
      ),
    );
  }
}
