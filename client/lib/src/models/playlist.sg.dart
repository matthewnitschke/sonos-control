import 'package:built_value/built_value.dart';

part 'playlist.sg.g.dart';

abstract class Playlist implements Built<Playlist, PlaylistBuilder> {
  String get name;
  String get uri;

  factory Playlist([void Function(PlaylistBuilder) updates]) = _$Playlist;
  Playlist._();
}