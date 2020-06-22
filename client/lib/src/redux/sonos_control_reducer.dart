import 'package:redux/redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';

class SonosControlReducer {
  Reducer<SonosControlState> _reducer;
  Reducer<SonosControlState> get reducer => _reducer;

  SonosControlReducer() {
    _reducer = combineReducers([
      TypedReducer<SonosControlState, SetPlayStateAction>(_setPlayState),
      TypedReducer<SonosControlState, SetVolumeAction>(_setVolume),
      TypedReducer<SonosControlState, SetCurrentTrackAction>(_setCurrentTrack),
      TypedReducer<SonosControlState, SetPlaylistsAction>(_setPlaylists),
      TypedReducer<SonosControlState, SetSpeakersAction>(_setSpeakers),
      TypedReducer<SonosControlState, AddDeviceToZoneAction>(_addDeviceToZone),
      TypedReducer<SonosControlState, RemoveDeviceFromZoneAction>(_removeDeviceFromZone),
    ]);
  }

  SonosControlState _setPlayState(SonosControlState state, SetPlayStateAction action) {
    return state.rebuild((b) => b
      ..isPlaying = action.isPlaying
    );
  }

  SonosControlState _setVolume(SonosControlState state, SetVolumeAction action) {
    return state.rebuild((b) => b
      ..volume = action.volume
    );
  }

  SonosControlState _setCurrentTrack(SonosControlState state, SetCurrentTrackAction action) {
    return state.rebuild((b) => b
      ..currentArtistName = action.currentArtistName
      ..currentTrackName = action.currentTrackName
      ..currentAlbumArtworkUrl = action.currentAlbumArtworkUrl
    );
  }

  SonosControlState _setPlaylists(SonosControlState state, SetPlaylistsAction action) {
    return state.rebuild((b) => b
      ..playlists = action.playlists.toBuilder()
    );
  }

  SonosControlState _setSpeakers(SonosControlState state, SetSpeakersAction action) {
    return state.rebuild((b) => b
      ..speakers = action.speakers.toBuilder()
    );
  }

  SonosControlState _addDeviceToZone(SonosControlState state, AddDeviceToZoneAction action) {
    return state.rebuild((b) => b
      ..speakers[action.deviceName] = true
    );
  }

  SonosControlState _removeDeviceFromZone(SonosControlState state, RemoveDeviceFromZoneAction action) {
    return state.rebuild((b) => b
      ..speakers[action.deviceName] = false
    );
  }
}