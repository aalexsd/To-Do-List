class ToDo{
  String? id;
  String? toDoText;
  bool isDone;

  ToDo({required this.id,
  required this.toDoText,
  this.isDone = false});

  static List<ToDo> todoList(){
    return [
      ToDo(id: '01', toDoText: 'Meditar'),
      ToDo(id: '02', toDoText: 'Tomar café', isDone: true),
      ToDo(id: '03', toDoText: 'Ler um livro'),
      ToDo(id: '04', toDoText: 'Tomar sol', isDone: true),
      ToDo(id: '05', toDoText: 'Estudar', isDone: true),
    ];
  }
}