import "package:todo_list/models/todo.dart";
import "package:provider/provider.dart";
import "package:flutter/material.dart";

class TodoDao extends ChangeNotifier{
  List<Todo> todoList = [];

  List<Todo> getTodos(){
    return todoList;
  }

  void insertTodo(String inputContent){
    todoList.add(Todo(false, inputContent));
    notifyListeners();
  }

  void updateTodo(Todo todo){
    todoList[todoList.indexOf(todo)] = todo;
    notifyListeners();
  }
}