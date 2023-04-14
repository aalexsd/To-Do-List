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
      ToDo(id: '06', toDoText: 'Passear com cachorro'),
      ToDo(id: '06', toDoText: 'Estudar Flutter', isDone: true),
      ToDo(id: '06', toDoText: 'Treinar', isDone: true),
      ToDo(id: '06', toDoText: 'Fazer amor com minha namorada', isDone: true),
    ];
  }
}