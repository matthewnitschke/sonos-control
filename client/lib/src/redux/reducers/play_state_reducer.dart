import 'package:redux/redux.dart';
import 'package:sonos_control_dart/src/models/play_state.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';


Reducer<PlayStateBuilder> playStateReducer = combineReducers([
  TypedReducer<PlayStateBuilder, SetPlayStateAction>(_setPlayState),
  TypedReducer<PlayStateBuilder, SetVolumeAction>(_setVolume),
  TypedReducer<PlayStateBuilder, SetCurrentTrackAction>(_setCurrentTrack),
]);

PlayStateBuilder _setPlayState(PlayStateBuilder state, SetPlayStateAction action) {
  return state
    ..isPlaying = action.isPlaying;
}

PlayStateBuilder _setVolume(PlayStateBuilder state, SetVolumeAction action) {
  return state
    ..volume = action.volume;
}

PlayStateBuilder _setCurrentTrack(PlayStateBuilder state, SetCurrentTrackAction action) {
  return state
    ..currentArtistName = action.currentArtistName
    ..currentTrackName = action.currentTrackName
    ..currentAlbumArtworkUrl = action.currentAlbumArtworkUrl
    ..currentAlbumArtworkAverageColor = action.currentAlbumArtworkAverageColor;
}