/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:todo_client/src/protocol/todo_tasks.dart' as _i3;
import 'package:todo_client/src/protocol/task.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointTodo extends _i1.EndpointRef {
  EndpointTodo(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'todo';

  _i2.Stream<_i3.TodoTasks> listenTasks() => caller.callStreamingServerEndpoint<
          _i2.Stream<_i3.TodoTasks>, _i3.TodoTasks>(
        'todo',
        'listenTasks',
        {},
        {},
      );

  _i2.Future<_i4.Task> createTask(_i4.Task task) =>
      caller.callServerEndpoint<_i4.Task>(
        'todo',
        'createTask',
        {'task': task},
      );

  _i2.Future<_i4.Task> updateTask(_i4.Task task) =>
      caller.callServerEndpoint<_i4.Task>(
        'todo',
        'updateTask',
        {'task': task},
      );

  _i2.Future<void> deleteTask(_i4.Task task) => caller.callServerEndpoint<void>(
        'todo',
        'deleteTask',
        {'task': task},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    todo = EndpointTodo(this);
  }

  late final EndpointTodo todo;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'todo': todo};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
