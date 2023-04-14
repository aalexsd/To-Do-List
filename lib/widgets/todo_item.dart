import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          print('Clicked on ToDo Item');
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        tileColor: Colors.white,
        leading: const Icon(Icons.check_box,
        size: 25,
        color: Colors.green,),
        title: const Text('Check Mail',
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          decoration: TextDecoration.lineThrough
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
              print('Click on Delete.');
            },
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
