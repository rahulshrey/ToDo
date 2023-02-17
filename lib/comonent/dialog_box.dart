import 'package:flutter/material.dart';
import 'package:todo/comonent/my_button.dart';

class DialogBox extends StatelessWidget {
  final update; 
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({Key? key, required this.update, required this.onSave, required this.onCancel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightBlueAccent,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           // we need TextField in Alert Dialog
           // get user input
             TextField(
              controller: update,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save buttons
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 10,),
                //cancel button
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),),
      
    );
  }
}