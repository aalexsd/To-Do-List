import 'package:flutter/material.dart';
import 'package:to_do_app/model/todo.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

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
                      for (ToDo todo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToChange,
                          onDeleteItem: _deleteToDoItem,
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
                    margin:
                        const EdgeInsets.only(bottom: 40, right: 20, left: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
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
                            elevation: 10),
                        onPressed: () {
                          _addToDoItem(_todoController.text);
                        },
                        child: const Icon(
                          Icons.add,
                          size: 56,
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          toDoText: toDo));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.toDoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(top: 10),
            prefixIcon: Icon(Icons.search,
              color: Colors.black,
              size: 25,),
            border: InputBorder.none,
            hintText: 'Buscar'
        ),
        style: const TextStyle(
            fontSize: 20
        ),
      ),
    );
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

}




