import 'package:serverpod/serverpod.dart';
import 'package:todo_server/src/generated/protocol.dart';

class TodoEndpoint extends Endpoint {
  Future<Task> createTask(Session session, Task task) async {
    final createdTasks = await Task.db.insert(session, [task]);

    return createdTasks.first;
  }

  Future<List<Task>> getTasks(Session session) async {
    return await Task.db.find(
      session,
      orderBy: (table) => table.id,
      orderDescending: true,
    );
  }

  Future<Task> updateTask(Session session, Task task) async {
    await Task.db.update(session, [task]);

    return task;
  }

  Future<void> deleteTask(Session session, Task task) async {
    await Task.db.delete(session, [task]);
  }
}
