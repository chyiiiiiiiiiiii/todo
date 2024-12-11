/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class TodoTasks
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TodoTasks._({required this.tasks});

  factory TodoTasks({required List<_i2.Task> tasks}) = _TodoTasksImpl;

  factory TodoTasks.fromJson(Map<String, dynamic> jsonSerialization) {
    return TodoTasks(
        tasks: (jsonSerialization['tasks'] as List)
            .map((e) => _i2.Task.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.Task> tasks;

  TodoTasks copyWith({List<_i2.Task>? tasks});
  @override
  Map<String, dynamic> toJson() {
    return {'tasks': tasks.toJson(valueToJson: (v) => v.toJson())};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'tasks': tasks.toJson(valueToJson: (v) => v.toJsonForProtocol())};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TodoTasksImpl extends TodoTasks {
  _TodoTasksImpl({required List<_i2.Task> tasks}) : super._(tasks: tasks);

  @override
  TodoTasks copyWith({List<_i2.Task>? tasks}) {
    return TodoTasks(
        tasks: tasks ?? this.tasks.map((e0) => e0.copyWith()).toList());
  }
}
