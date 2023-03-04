import "package:flutter/material.dart";
import "package:todo_list/components/common_drawer.dart";
import "package:todo_list/components/todo_component.dart";
import "package:todo_list/daos/todo_dao.dart";
import "package:provider/provider.dart";

class TodoInputDemoScreen extends StatefulWidget{
  List<String> todoList = [];

  @override
  State createState() {
    return _TodoInputDemoScreen();
  }
}

class _TodoInputDemoScreen extends State<TodoInputDemoScreen>{
  @override
  Widget build(BuildContext context){
    var textEditController = TextEditingController();

    Widget userInputTextField = Container(
      width: 500,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "輸入要執行的任務"
        ),
        controller: textEditController,
        onSubmitted: (inputValue){
          setState((){
            context.read<TodoDao>().insertTodo(inputValue);
            textEditController.clear();
          });
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            userInputTextField,
            ...context.watch<TodoDao>().getTodos().map(
                (taskTodo) => Container(child: TodoComponent(taskTodo))
            ).toList()
          ],
        ),
      )
    );
  }
}