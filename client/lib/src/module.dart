import 'package:built_collection/built_collection.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:redux/redux.dart';
import 'package:sonos_control_dart/src/models/music_library.sg.dart';
import 'package:sonos_control_dart/src/models/playlist.sg.dart';
import 'package:sonos_control_dart/src/redux/reducers/music_library_reducer.dart';
import 'package:sonos_control_dart/src/redux/reducers/play_state_reducer.dart';
import 'package:sonos_control_dart/src/redux/reducers/speakers_reducer.dart';
import 'package:sonos_control_dart/src/redux/sonos_api_middleware.dart';
import 'package:sonos_control_dart/src/utils/music_library_api.dart';
import 'package:sonos_control_dart/src/utils/sonos_api.dart';

import 'components/app.dart';
import 'models/play_state.sg.dart';
import 'models/sonos_control_state.sg.dart';

class SonosControlModule {
  SonosActionAPI _sonosActionApi;

  Store<SonosControlState> _store;

  SonosControlModule() {
    _sonosActionApi = SonosActionAPI();

    SonosControlState appStateReducers(SonosControlState state, action) => (SonosControlStateBuilder()
      ..playState = playStateReducer(state.playState.toBuilder(), action)
      ..musicLibrary = musicLibraryReducer(state.musicLibrary.toBuilder(), action)
      ..speakers = speakersReducer(state.speakers.toBuilder(), action)
    ).build();

    _store = Store<SonosControlState>(
      appStateReducers,
      initialState: SonosControlState((b) => b
        ..playState = (PlayStateBuilder()
          ..isPlaying = false
          ..volume = 0
          ..currentAlbumArtworkUrl = ''
          ..currentArtistName = ''
          ..currentTrackName = ''
        )
        ..musicLibrary = (MusicLibraryBuilder()
          ..isSpotifyAuthed = true
          ..playlists = ListBuilder<Playlist>()
        )
      ),
      middleware: SonosAPIMiddleware(_sonosActionApi).middleware,
    );

    SonosEventAPI(_store);
    MusicLibraryAPI(_store);
  }

  Object content() {
    return (ReduxProvider()
      ..store = _store
    )(
      App()()
    );
  }
}