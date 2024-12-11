import 'package:serverpod/serverpod.dart';
import 'package:todo_server/src/generated/protocol.dart';

final tasks = <Task>[];

class TodoEndpoint extends Endpoint {
  Future<Task> createTask(Session session, Task task) async {
    tasks.add(task);

    return task;
  }

  Future<List<Task>> getTasks(Session session) async {
    return tasks.reversed.toList();
  }

  Future<Task> updateTask(Session session, Task task) async {
    tasks[tasks.indexWhere((t) => t.id == task.id)] = task;

    return task;
  }

  Future<void> deleteTask(Session session, UuidValue id) async {
    tasks.removeWhere((t) => t.id == id);
  }
}
