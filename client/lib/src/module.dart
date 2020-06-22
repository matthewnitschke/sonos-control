import 'package:built_collection/built_collection.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:redux/redux.dart';
import 'package:sonos_control_dart/src/models/playlist.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_api_middleware.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_reducer.dart';
import 'package:sonos_control_dart/src/utils/music_library_api.dart';
import 'package:sonos_control_dart/src/utils/sonos_api.dart';

import 'components/app.dart';
import 'models/sonos_control_state.sg.dart';

class SonosControlModule {
  SonosActionAPI _sonosActionApi;

  Store<SonosControlState> _store;

  SonosControlModule() {
    _sonosActionApi = SonosActionAPI();

    _store = Store<SonosControlState>(
      SonosControlReducer().reducer,
      initialState: SonosControlState((b) => b
        ..isPlaying = false
        ..volume = 0
        ..currentAlbumArtworkUrl = ''
        ..currentArtistName = ''
        ..currentTrackName = ''
        ..playlists = ListBuilder<Playlist>()
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