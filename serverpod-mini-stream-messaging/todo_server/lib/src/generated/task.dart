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

abstract class Task
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Task._({
    required this.id,
    required this.name,
    required this.isDone,
    required this.createAt,
  });

  factory Task({
    required _i1.UuidValue id,
    required String name,
    required bool isDone,
    required DateTime createAt,
  }) = _TaskImpl;

  factory Task.fromJson(Map<String, dynamic> jsonSerialization) {
    return Task(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      isDone: jsonSerialization['isDone'] as bool,
      createAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createAt']),
    );
  }

  _i1.UuidValue id;

  String name;

  bool isDone;

  DateTime createAt;

  Task copyWith({
    _i1.UuidValue? id,
    String? name,
    bool? isDone,
    DateTime? createAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'isDone': isDone,
      'createAt': createAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'name': name,
      'isDone': isDone,
      'createAt': createAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TaskImpl extends Task {
  _TaskImpl({
    required _i1.UuidValue id,
    required String name,
    required bool isDone,
    required DateTime createAt,
  }) : super._(
          id: id,
          name: name,
          isDone: isDone,
          createAt: createAt,
        );

  @override
  Task copyWith({
    _i1.UuidValue? id,
    String? name,
    bool? isDone,
    DateTime? createAt,
  }) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      isDone: isDone ?? this.isDone,
      createAt: createAt ?? this.createAt,
    );
  }
}
