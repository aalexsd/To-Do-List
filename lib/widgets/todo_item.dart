import 'package:flutter/material.dart';
import 'package:to_do_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

   const ToDoItem({Key? key,required this.todo,
   required this.onDeleteItem,
   required this.onToDoChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
        size: 25,
        color: Colors.green,),
        title: Text(todo.toDoText!,
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          decoration: todo.isDone? TextDecoration.lineThrough : null,
        ),
        ),
        trailing: Container(
          height: 35,
            width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 20,
            onPressed: (){
              onDeleteItem(todo.id);
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
