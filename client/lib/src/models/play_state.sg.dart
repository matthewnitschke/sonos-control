import 'package:built_value/built_value.dart';

part 'play_state.sg.g.dart';

abstract class PlayState implements Built<PlayState, PlayStateBuilder> {
  /// Whether or not the main device speaker is playing
  bool get isPlaying;

  /// the current volume for the main device speaker
  int get volume;

  /// the current track name for the main device speaker
  String get currentTrackName;

  /// the current track's artist name for the main device speaker
  String get currentArtistName;

  /// the album artwork url for the current track on the main device speaker
  String get currentAlbumArtworkUrl;
  
  String get currentAlbumArtworkAverageColor;

  factory PlayState([void Function(PlayStateBuilder) updates]) = _$PlayState;
  PlayState._();
}