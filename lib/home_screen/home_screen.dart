import 'package:flutter/material.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/widgets/search_box.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchBox(),
                Expanded(
                    child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40.0, bottom: 20),
                      child: Text(
                        'All ToDos',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    for (ToDo todo in todosList)
                      ToDoItem(
                        todo: todo,
                        onToDoChanged: _handleToChange,
                        onDeleteItem: (){},
                      ),
                  ],
                ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 40,
                      right: 20,
                      left: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20,
                    vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow:const [BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      style: TextStyle(
                        fontSize: 18
                      ),
                      decoration: InputDecoration(
                        hintText: 'Adicione uma nova tarefa',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          minimumSize: const Size(56, 56),
                          elevation: 10
                        ),
                        onPressed: (){
                        },
                        child: const Icon(Icons.add, size: 56,)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  void _handleToChange(ToDo todo ){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void_dele

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
