import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:sonos_control_dart/src/models/playlist.sg.dart';
import 'package:sonos_control_dart/src/models/speaker.sg.dart';

part 'sonos_control_state.sg.g.dart';

abstract class SonosControlState implements Built<SonosControlState, SonosControlStateBuilder> {

  bool get isPlaying;

  int get volume;

  String get currentTrackName;

  String get currentArtistName;

  String get currentAlbumArtworkUrl;

  BuiltList<Playlist> get playlists;

  BuiltMap<String, bool> get speakers;

  factory SonosControlState([void Function(SonosControlStateBuilder) updates]) = _$SonosControlState;
  SonosControlState._();
}