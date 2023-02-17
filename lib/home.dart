import 'package:flutter/material.dart';
import 'package:todo/comonent/todotile.dart';

import 'comonent/dialog_box.dart';

class HomePage extends StatefulWidget {
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // text controller
  final _controller = TextEditingController();
  // list of todo tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
  ];

  // if checkbox was tapped
  void checkboxChanged(bool? value, int index) {
    setState(()
    {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  // save a new task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]); // adds to the list by getting texts from the controller.
      _controller.clear(); // when you try to create a new task, it will still show last task name so to clear that we use clear method.
    });
    Navigator.of(context).pop();
  }
  // New Task creating function
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
        return DialogBox(
          update: _controller, 
          onCancel: () => Navigator.of(context).pop(),
           onSave: saveNewTask,);
      }
    );
  }

  // delete task
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('To DO'),
        // For no Shadows
        elevation: 0,
      ),
      //Add new Task Button
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),),
      // We need list view of tiles ( to do task list)
      body: ListView.builder(
       itemCount: toDoList.length,
       itemBuilder: (context, index) {
        return ToDoTile(taskName: toDoList[index][0],
        taskCompleted: toDoList[index][1],
        onChanged: (value) => checkboxChanged(value, index),
        deleteFunction: (context) => deleteTask(index),
        
        );

       }),
      );
  }
}