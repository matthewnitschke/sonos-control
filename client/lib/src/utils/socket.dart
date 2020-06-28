
import 'dart:html';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class ServerSocket {
  static final ServerSocket _singleton = ServerSocket._internal();
  factory ServerSocket() => _singleton;

  IO.Socket get socket => _socket;
  IO.Socket _socket;
  ServerSocket._internal() {
    final loc = window.location;
    _socket = IO.io(loc.origin);
  }
}