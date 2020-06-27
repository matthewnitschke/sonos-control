import 'package:built_collection/built_collection.dart';
import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/playlist.sg.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';

part 'spotify_library.over_react.g.dart';

UiFactory<SpotifyLibraryProps> SpotifyLibrary = connect<SonosControlState, SpotifyLibraryProps>(
  mapStateToProps: (state) => (SpotifyLibrary()
    ..playlists = state.playlists
  ),
  mapDispatchToProps: (dispatch) => (SpotifyLibrary()
    ..onPlaylistClick = ((playlist) => dispatch(PlayURIAction(playlist.uri)))
  ),
)(_$SpotifyLibrary); // ignore: undefined_identifier

mixin SpotifyLibraryProps on UiProps {
  BuiltList<Playlist> playlists;

  void Function(Playlist) onPlaylistClick;
}

class SpotifyLibraryComponent extends UiComponent2<SpotifyLibraryProps> {
  @override
  Map get defaultProps => (newProps());

  @override
  ReactElement render() {
    return (Dom.div()
      ..className = 'spotify-library'
    )(
      (Dom.div()
        ..className = 'panel-title'
      )('Playlists'),
      props.playlists.map<ReactElement>((playlist) {
        return (Dom.div()
          ..key = playlist.name
          ..className = 'playlist-item'
          ..onClick = ((_) => props.onPlaylistClick(playlist))
        )(playlist.name);
      }).toList()
    );
  }
}