import 'dart:html';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:sonos_control_dart/src/models/playlist.sg.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';
import 'package:sonos_control_dart/src/utils/socket.dart';

class MusicLibraryAPI {
  final Store<SonosControlState> _store;

  MusicLibraryAPI(this._store) {
    _getMusicLibrary();
  }

  Future<void> _getMusicLibrary() async {
    final socket = ServerSocket().socket;

    socket.emitWithAck('sonos-library', null, ack: (items) {
      final builtItems = BuiltList<Playlist>(
        items.map((item) {
          return Playlist((b) => b
            ..name = item['name'] as String
            ..uri = item['uri'] as String
          );
        })
      );

      _store.dispatch(SetPlaylistsAction(builtItems));
    });
  }
}