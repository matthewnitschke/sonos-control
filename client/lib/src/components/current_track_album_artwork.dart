import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';

part 'current_track_album_artwork.over_react.g.dart';

mixin CurrentTrackAlbumArtworkProps on UiProps {
  String currentAlbumArtworkUrl;
}

UiFactory<CurrentTrackAlbumArtworkProps> CurrentTrackAlbumArtwork = connect<SonosControlState, CurrentTrackAlbumArtworkProps>(
  mapStateToProps: (state) => (CurrentTrackAlbumArtwork()
    ..currentAlbumArtworkUrl = state.playState.currentAlbumArtworkUrl
  ),
  mapDispatchToProps: (dispatch) => (CurrentTrackAlbumArtwork()),
)(
  uiFunction((props) {
    return (Dom.div()
      ..className = 'current-track__art'
      ..style = {'backgroundImage': 'url(${props.currentAlbumArtworkUrl})'}
    )();
  }, $CurrentTrackAlbumArtworkConfig, // ignore: undefined_identifier, argument_type_not_assignable
));
