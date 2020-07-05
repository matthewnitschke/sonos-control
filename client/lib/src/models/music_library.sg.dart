import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:sonos_control_dart/src/models/playlist.sg.dart';

part 'music_library.sg.g.dart';

abstract class MusicLibrary implements Built<MusicLibrary, MusicLibraryBuilder> {
  bool get isSpotifyAuthed;

  BuiltList<Playlist> get playlists;
  
  factory MusicLibrary([void Function(MusicLibraryBuilder) updates]) = _$MusicLibrary;
  MusicLibrary._();
}