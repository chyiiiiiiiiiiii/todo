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

abstract class CreateTaskException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  CreateTaskException._({required this.message});

  factory CreateTaskException({required String message}) =
      _CreateTaskExceptionImpl;

  factory CreateTaskException.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateTaskException(message: jsonSerialization['message'] as String);
  }

  String message;

  CreateTaskException copyWith({String? message});
  @override
  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'message': message};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CreateTaskExceptionImpl extends CreateTaskException {
  _CreateTaskExceptionImpl({required String message})
      : super._(message: message);

  @override
  CreateTaskException copyWith({String? message}) {
    return CreateTaskException(message: message ?? this.message);
  }
}
