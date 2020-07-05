import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';

part 'current_track_album_artwork.over_react.g.dart';

UiFactory<CurrentTrackAlbumArtworkProps> CurrentTrackAlbumArtwork = connect<SonosControlState, CurrentTrackAlbumArtworkProps>(
  mapStateToProps: (state) => (CurrentTrackAlbumArtwork()
    ..currentAlbumArtworkUrl = state.playState.currentAlbumArtworkUrl
  ),
)(_$CurrentTrackAlbumArtwork); // ignore: undefined_identifier

mixin CurrentTrackAlbumArtworkProps on UiProps {
  String currentAlbumArtworkUrl;
}

class CurrentTrackAlbumArtworkComponent extends UiComponent2<CurrentTrackAlbumArtworkProps> {
  @override
  Map get defaultProps => (newProps());

  @override
  ReactElement render() {
    return (Dom.div()
      ..className = 'current-track__art'
      ..style = {'backgroundImage': 'url(${props.currentAlbumArtworkUrl})'}
    )();
  }
}