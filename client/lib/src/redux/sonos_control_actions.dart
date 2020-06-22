
import 'package:built_collection/built_collection.dart';
import 'package:sonos_control_dart/src/models/playlist.sg.dart';
import 'package:sonos_control_dart/src/models/speaker.sg.dart';

class ServerSyncedAction {
  /// Whether or not to send the update command to the server, used 
  /// when updating play state from socket
  /// 
  /// Default: `true`
  final bool sendToServer;

  ServerSyncedAction(bool sendToServer) : sendToServer = sendToServer ?? true;
}


class SetPlayStateAction extends ServerSyncedAction {
  final bool isPlaying;

  SetPlayStateAction(this.isPlaying, { bool sendToServer }) : super(sendToServer);
}

class NextTrackAction {
  NextTrackAction();
}

class PreviousTrackAction {
  PreviousTrackAction();
}

class SetVolumeAction extends ServerSyncedAction {
  int volume;

  SetVolumeAction(this.volume, { bool sendToServer }) : super(sendToServer);
}

class SetCurrentTrackAction {
  final String currentTrackName;
  final String currentArtistName;
  final String currentAlbumArtworkUrl;

  SetCurrentTrackAction({
    this.currentTrackName,
    this.currentArtistName,
    this.currentAlbumArtworkUrl,
  });
}

class PlayURIAction {
  String uri;

  PlayURIAction(this.uri);
}

class SetPlaylistsAction {
  BuiltList<Playlist> playlists;

  SetPlaylistsAction(this.playlists);
}

class SetSpeakersAction {
  BuiltMap<String, bool> speakers;

  SetSpeakersAction(this.speakers);
}

class AddDeviceToZoneAction extends ServerSyncedAction {
  final String deviceName;

  AddDeviceToZoneAction(this.deviceName, { bool sendToServer }) : super(sendToServer);
}

class RemoveDeviceFromZoneAction extends ServerSyncedAction {
  final String deviceName;

  RemoveDeviceFromZoneAction(this.deviceName, { bool sendToServer }) : super(sendToServer);
}