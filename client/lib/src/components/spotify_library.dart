import 'package:built_collection/built_collection.dart';
import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/playlist.sg.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';

part 'spotify_library.over_react.g.dart';

UiFactory<SpotifyLibraryProps> SpotifyLibrary = connect<SonosControlState, SpotifyLibraryProps>(
  mapStateToProps: (state) => (SpotifyLibrary()
    ..isAuthed = state.musicLibrary.isSpotifyAuthed
    ..playlists = state.musicLibrary.playlists
  ),
  mapDispatchToProps: (dispatch) => (SpotifyLibrary()
    ..onPlaylistClick = ((playlist) => dispatch(PlayURIAction(playlist.uri)))
  ),
)(_$SpotifyLibrary); // ignore: undefined_identifier

mixin SpotifyLibraryProps on UiProps {
  bool isAuthed;
  BuiltList<Playlist> playlists;

  void Function(Playlist) onPlaylistClick;
}

class SpotifyLibraryComponent extends UiComponent2<SpotifyLibraryProps> {
  @override
  ReactElement render() {
    if (!props.isAuthed) {
      return (Dom.h3()
        ..className = 'panel-content'
      )(
        'Spotify Not Authenticated. Please check env vars'
      );
    }

    return (Dom.div()
      ..className = 'spotify-library'
    )(
      (Dom.div()
        ..className = 'panel-title'
      )('Playlists'),
      props.playlists.map<ReactElement>((playlist) {
        return (Dom.div()
          ..key = playlist.name
          ..className = 'panel-list-item'
          ..onClick = ((_) => props.onPlaylistClick(playlist))
        )(playlist.name);
      }).toList()
    );
  }
}