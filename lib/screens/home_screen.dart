import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/Home_screen';
  final TodoController todoController = Get.put(TodoController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.toNamed(TodoScreen.id);
        },
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.redAccent,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (_) {
              todoController.todos.removeAt(index);
              Get.snackbar('Removed!', "Task was succesfully Removed",
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: ListTile(
              
              title: Text(
                
                todoController.todos[index].title!,
                key: ValueKey('titleKey$index'),
                style: todoController.todos[index].isDone
                    ? const TextStyle(
                        color: Colors.greenAccent,
                        decoration: TextDecoration.lineThrough,
                      )
                    : const TextStyle(
                        color: Colors.black,
                      ),
              ),
              leading: Checkbox(
                key: ValueKey('checkBoxKey$index'),
                value: todoController.todos[index].isDone,
                onChanged: (neWvalue) {
                  var todo = todoController.todos[index];
                  todo.isDone = neWvalue!;
                  todoController.todos[index] = todo;
                },
              ),
            ),
          ),
          itemCount: todoController.todos.length,
        ),
      ),
    );
  }
}