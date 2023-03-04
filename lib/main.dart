import "package:flutter/material.dart";
import "package:todo_list/screens/count_todo_demo_screen.dart";
import "package:todo_list/screens/todo_input_demo_screen.dart";
import "package:provider/provider.dart";
import "package:todo_list/daos/todo_dao.dart";

void main(){
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=>TodoDao(),)
      ],
      child: AppEntryPoint()
    )
  );
}

class AppEntryPoint extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/task": (BuildContext context) => TodoInputDemoScreen(),
        "/amount": (BuildContext context) => CountTodoDemoScreen(),
      },
      initialRoute: "/task",
    );
  }
}