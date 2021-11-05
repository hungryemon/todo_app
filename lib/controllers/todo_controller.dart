import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoController extends GetxController {
  var todos = List<Todo>.empty().obs;
  var completedTasks = List<Todo>.empty().obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todo');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todo', todos.toList());
    });

    List? storedCompletedTasks = GetStorage().read('completedTask');
     if (storedCompletedTasks != null) {
      todos = storedCompletedTasks.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(completedTasks, (_) {
      GetStorage().write('completedTask', completedTasks.toList());
    });
    super.onInit();
  }
}
