import 'package:serverpod/serverpod.dart';
import 'package:todo_server/src/generated/protocol.dart';

class TodoEndpoint extends Endpoint {
  static const String _channelTasks = 'tasks';

  final tasks = <Task>[];

  @override
  Future<void> streamOpened(StreamingSession session) async {
    print('streamOpened()');

    session.messages.addListener(
      _channelTasks,
      (message) {
        print('Channel: $_channelTasks, Message: $message');
      },
    );
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    print('streamClosed()');
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableModel message,
  ) async {
    print(
        'handleStreamMessage() - StreamingSession: $session, SerializableModel: $message');
  }

  void _getTasks(Session session) {
    final todoTasks = TodoTasks(tasks: List.from(tasks.reversed));
    session.messages.postMessage(_channelTasks, todoTasks);
  }

  Stream<TodoTasks> listenTasks(Session session) async* {
    final tasksUpdatedStream =
        session.messages.createStream<TodoTasks>(_channelTasks);

    _getTasks(session);

    await for (final newTasks in tasksUpdatedStream) {
      yield newTasks;
    }
  }

  Future<Task> createTask(Session session, Task task) async {
    tasks.add(task);

    _getTasks(session);

    return task;
  }

  Future<Task> updateTask(Session session, Task task) async {
    final index = tasks.indexWhere((t) => t.id == task.id);
    tasks[index] = task;

    _getTasks(session);

    return task;
  }

  Future<void> deleteTask(Session session, Task task) async {
    tasks.removeWhere((t) => t.id == task.id);

    _getTasks(session);
  }
}
