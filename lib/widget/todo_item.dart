import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/todo.dart';

class ToDoitem extends StatelessWidget {
  final ToDo todo;
  // ignore: prefer_typing_uninitialized_variables
  final onToDoChanged;
  // ignore: prefer_typing_uninitialized_variables
  final onDeleteItem;

  const ToDoitem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
          //print("okay");
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText!,
          style: const TextStyle(
            fontSize: 16,
            color: tdBlack,
            //decoration: TextDecoration.lineThrough,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 15,
            icon: const Icon(Icons.delete),
            onPressed: () {
              //print('okay deleted successfully');
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
