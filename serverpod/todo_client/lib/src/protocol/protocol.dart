/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'task.dart' as _i2;
import 'task_exception.dart' as _i3;
import 'package:todo_client/src/protocol/task.dart' as _i4;
export 'task.dart';
export 'task_exception.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Task) {
      return _i2.Task.fromJson(data) as T;
    }
    if (t == _i3.CreateTaskException) {
      return _i3.CreateTaskException.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Task?>()) {
      return (data != null ? _i2.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CreateTaskException?>()) {
      return (data != null ? _i3.CreateTaskException.fromJson(data) : null)
          as T;
    }
    if (t == List<_i4.Task>) {
      return (data as List).map((e) => deserialize<_i4.Task>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Task) {
      return 'Task';
    }
    if (data is _i3.CreateTaskException) {
      return 'CreateTaskException';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Task') {
      return deserialize<_i2.Task>(data['data']);
    }
    if (data['className'] == 'CreateTaskException') {
      return deserialize<_i3.CreateTaskException>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
