import 'package:flutter/material.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late final _textEditingController = TextEditingController();
  final tasks = <Task>[];

  @override
  void initState() {
    super.initState();

    getTasks();
  }

  void getTasks() async {
    tasks.clear();
    final result = await client.todo.getTasks();

    setState(() {
      tasks.addAll(result);
    });
  }

  void createTask() async {
    final taskName = _textEditingController.text;
    final task = Task(
      id: UuidValue.fromString(const Uuid().v6()),
      name: taskName,
      isDone: false,
      createAt: DateTime.now(),
    );

    try {
      setState(() {
        tasks.insert(0, task);
        _textEditingController.clear();
      });

      final _ = await client.todo.createTask(task);
    } catch (e) {
      setState(() {
        tasks.remove(task);
      });

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> updateTask(int index) async {
    final task = tasks.elementAt(index);
    final newTask = task.copyWith(isDone: !task.isDone);

    try {
      setState(() {
        tasks[index] = newTask;
      });

      await client.todo.updateTask(newTask);
    } catch (e) {
      setState(() {
        tasks[index] = task;
      });

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void deleteTask(int index) async {
    final task = tasks.elementAt(index);

    try {
      setState(() {
        tasks.remove(task);
      });

      await client.todo.deleteTask(task.id);
    } catch (e) {
      setState(() {
        tasks.insert(index, task);
      });

      if (!mounted) {
        return;
      }
      
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  final task = tasks.elementAt(index);

                  return Card(
                    key: ValueKey(task.id),
                    child: ListTile(
                      leading: Text(
                        (index + 1).toString(),
                      ),
                      title: Text(task.name),
                      subtitle: Text(task.createAt.toString()),
                      trailing: Icon(task.isDone
                          ? Icons.check_box
                          : Icons.check_box_outline_blank),
                      onTap: () => updateTask(index),
                      onLongPress: () => deleteTask(index),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 8.0,
                  );
                },
                itemCount: tasks.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Enter task',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: createTask,
                child: const Text('Add Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
