import 'package:redux/redux.dart';
import 'package:sonos_control_dart/src/models/music_library.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';


Reducer<MusicLibraryBuilder> musicLibraryReducer = combineReducers([
  TypedReducer<MusicLibraryBuilder, SetPlaylistsAction>(_setPlaylists),
  TypedReducer<MusicLibraryBuilder, SetSpotifyAuthStateAction>(_setSpotifyAuth),
]);

MusicLibraryBuilder _setPlaylists(MusicLibraryBuilder state, SetPlaylistsAction action) {
  return state
    ..playlists = action.playlists.toBuilder();
}

MusicLibraryBuilder _setSpotifyAuth(MusicLibraryBuilder state, SetSpotifyAuthStateAction action) {
  return state
    ..isSpotifyAuthed = action.hasAuth;
}