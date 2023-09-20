import 'dart:async';
import 'dart:io' as io;

import 'package:test/test.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:deriv_web_socket_client/deriv_web_socket_client.dart';

void main() {
  group('WebSocket', () {
    const int port = 8080;
    const int closeCode = 4200;
    const String closeReason = '__reason__';

    final Uri uri = Uri.parse('ws://localhost:$port');

    io.HttpServer? server;

    tearDown(() => server?.close(force: true));

    group('connection =>', () {
      test(
          'emits [connecting, disconnected, reconnecting] when not able to establish a connection.',
          () async {
        final WebSocket socket = WebSocket(uri);

        await expectLater(
          socket.connection,
          emitsInOrder(<dynamic>[
            const ConnectingState(),
            isDisconnected(
              whereError: isA<io.SocketException>(),
              whereStackTrace: isNotNull,
            ),
            const ReconnectingState(),
          ]),
        );

        expect(socket.connection.state, equals(const ReconnectingState()));

        await socket.close();
      });

      test('emits [connecting, connected] when able to establish a connection.',
          () async {
        server = await createWebSocketServer();

        final WebSocket socket =
            WebSocket(Uri.parse('ws://localhost:${server!.port}'));

        await expectLater(
          socket.connection,
          emitsInOrder(<ConnectionState>[
            const ConnectingState(),
            const ConnectedState(),
          ]),
        );

        expect(socket.connection.state, equals(const ConnectedState()));

        await socket.close();
      });

      test(
          'emits [connecting, disconnected, reconnecting, reconnected] when able to establish a connection after retries.',
          () async {
        final WebSocket socket = WebSocket(Uri.parse('ws://localhost:$port'));

        await expectLater(
          socket.connection,
          emitsInOrder(<dynamic>[
            const ConnectingState(),
            isDisconnected(
              whereError: isA<io.SocketException>(),
              whereStackTrace: isNotNull,
            ),
            const ReconnectingState(),
          ]),
        );

        expect(socket.connection.state, equals(const ReconnectingState()));
        server = await createWebSocketServer(port: port);

        await Future<void>.delayed(const Duration(milliseconds: 100));
        expect(socket.connection.state, equals(const ReconnectedState()));

        await socket.close();
      });

      test(
          'emits [connecting, connected, reconnecting, reconnected] when able to re-establish a connection.',
          () async {
        WebSocketChannel? channel;

        server = await createWebSocketServer(
          port: port,
          onConnection: (WebSocketChannel c) => channel = c,
        );

        final List<ConnectionState> connectionStates = <ConnectionState>[];

        final WebSocket socket = WebSocket(Uri.parse('ws://localhost:$port'))
          ..connection.listen(connectionStates.add);

        await expectLater(
          socket.connection,
          emitsInOrder(<ConnectionState>[
            const ConnectingState(),
            const ConnectedState(),
          ]),
        );

        expect(socket.connection.state, equals(const ConnectedState()));

        await channel!.sink.close(closeCode, closeReason);
        await server!.close(force: true);

        expect(
          connectionStates,
          equals(<ConnectionState>[
            const ConnectingState(),
            const ConnectedState(),
            const DisconnectedState(code: closeCode, reason: closeReason),
            const ReconnectingState(),
          ]),
        );

        expect(socket.connection.state, equals(const ReconnectingState()));

        server = await createWebSocketServer(
          port: port,
          onConnection: (WebSocketChannel c) => channel = c,
        );

        await expectLater(
          socket.connection,
          emitsInOrder(<ConnectionState>[
            const ReconnectingState(),
            const ReconnectedState(),
          ]),
        );

        expect(socket.connection.state, equals(const ReconnectedState()));

        await channel!.sink.close();
        await server!.close(force: true);
        await socket.close();
      });

      test(
          'emits [connecting, connected, disconnecting, disconnected] when close is called after establishing a connection.',
          () async {
        server = await createWebSocketServer();

        final List<ConnectionState> connectionStates = <ConnectionState>[];
        final WebSocket socket = WebSocket(
          Uri.parse('ws://localhost:${server!.port}'),
        )..connection.listen(connectionStates.add);

        await expectLater(
          socket.connection,
          emitsInOrder(<ConnectionState>[
            const ConnectingState(),
            const ConnectedState(),
          ]),
        );

        await socket.close(closeCode, closeReason);

        await server!.close();

        await expectLater(
          connectionStates,
          equals(<ConnectionState>[
            const ConnectingState(),
            const ConnectedState(),
            const DisconnectingState(),
            const DisconnectedState(code: closeCode, reason: closeReason),
          ]),
        );

        expect(
          socket.connection.state,
          equals(const DisconnectedState(code: closeCode, reason: closeReason)),
        );
      });
    });

    group('messages =>', () {
      test('emits messages when connection is open.', () async {
        server = await createWebSocketServer(
          onConnection: (WebSocketChannel channel) {
            channel.sink
              ..add('ping')
              ..add('pong');
          },
        );

        final List<dynamic> messages = <dynamic>[];
        final WebSocket socket = WebSocket(
          Uri.parse('ws://localhost:${server!.port}'),
        )..messages.listen(messages.add);

        await expectLater(
          socket.connection,
          emitsInOrder(<ConnectionState>[
            const ConnectingState(),
            const ConnectedState(),
          ]),
        );

        await Future<void>.delayed(Duration.zero);

        expect(messages, equals(<String>['ping', 'pong']));

        await socket.close();
      });

      test('emits nothing when connection is closed.', () async {
        final List<dynamic> messages = <dynamic>[];
        final WebSocket socket = WebSocket(uri)..messages.listen(messages.add);

        await Future<void>.delayed(Duration.zero);
        await socket.close();
        await Future<void>.delayed(Duration.zero);

        expect(messages, isEmpty);
      });
    });

    group('send =>', () {
      test('does nothing when connection is closed.', () async {
        final WebSocket socket = WebSocket(uri);

        expect(() => socket.send(null), returnsNormally);

        await socket.close();
      });

      test('sends message when connection is open.', () async {
        final List<dynamic> messages = <dynamic>[];

        server = await createWebSocketServer(
          onConnection: (WebSocketChannel channel) =>
              channel.stream.listen(messages.add),
        );

        final WebSocket socket = WebSocket(
          Uri.parse('ws://localhost:${server!.port}'),
        );

        await expectLater(
          socket.connection,
          emitsInOrder(<ConnectionState>[
            const ConnectingState(),
            const ConnectedState(),
          ]),
        );

        socket
          ..send('ping')
          ..send('pong');

        await Future<void>.delayed(Duration.zero);

        expect(messages, equals(<String>['ping', 'pong']));

        await socket.close();
      });
    });

    group('close =>', () {
      test('does nothing when connection is closed.', () async {
        final WebSocket socket = WebSocket(uri);

        await expectLater(
          socket.connection,
          emitsInOrder(<dynamic>[
            const ConnectingState(),
            isDisconnected(
              whereError: isA<io.SocketException>(),
              whereStackTrace: isNotNull,
            ),
            const ReconnectingState(),
          ]),
        );

        expect(socket.connection.state, equals(const ReconnectingState()));
        expect(socket.close, returnsNormally);

        await expectLater(
          socket.connection,
          emitsInOrder(<ConnectionState>[const DisconnectedState()]),
        );

        expect(socket.connection.state, equals(const DisconnectedState()));
      });
    });
  });
}

Future<io.HttpServer> createWebSocketServer({
  void Function(WebSocketChannel channel)? onConnection,
  int port = 0,
}) async {
  final io.HttpServer server = await io.HttpServer.bind('localhost', port);

  server.transform(io.WebSocketTransformer()).listen((io.WebSocket webSocket) {
    if (onConnection != null) {
      onConnection(IOWebSocketChannel(webSocket));
    }
  });

  return server;
}

Matcher isDisconnected({
  Matcher? whereError,
  Matcher? whereStackTrace,
}) =>
    isA<DisconnectedState>()
        .having((DisconnectedState state) => state.error, 'error', whereError)
        .having(
          (DisconnectedState state) => state.stackTrace,
          'stackTrace',
          whereStackTrace,
        );
