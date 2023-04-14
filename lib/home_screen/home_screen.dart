import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/search_box.dart';

import '../widgets/todo_item.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: _buildAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,
        vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBox(),
            const Padding(
              padding:  EdgeInsets.only(top: 40.0,
              bottom: 20),
              child: Text('All ToDos',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Expanded(child: ListView(
              children: const [
                ToDoItem(),
                ToDoItem(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: const Color(0xFFEEEFF5),
    leading: const Icon(Icons.menu),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpeg'),
        ),
      )
    ],
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );
}



