import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/controllers/todo_controller.dart';

class TodoScreen extends StatelessWidget {
  static const id = '/Todo_Screen';
  final TodoController todoController = Get.find<TodoController>();

  final TextEditingController textEditingController = TextEditingController();

  TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    key: const ValueKey("enterTask"),
                    // textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "Enter you task.",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    autofocus: true,
                    controller: textEditingController,
                    
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red
                      ),
                      child: const Text('Cancel'),
                  
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green
                      ),
                      child: const Text('Add'),
                        
                      onPressed: () {
                        todoController.todos.add(
                          Todo(
                            title: textEditingController.text,
                          ),
                        );
                        Get.back();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
