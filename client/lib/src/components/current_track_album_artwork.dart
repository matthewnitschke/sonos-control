import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';

part 'current_track_album_artwork.over_react.g.dart';

mixin CurrentTrackAlbumArtworkProps on UiProps {
  String currentAlbumArtworkUrl;
  String currentAlbumArtworkAverageColor;
}

UiFactory<CurrentTrackAlbumArtworkProps> CurrentTrackAlbumArtwork = connect<SonosControlState, CurrentTrackAlbumArtworkProps>(
  mapStateToProps: (state) => (CurrentTrackAlbumArtwork()
    ..currentAlbumArtworkUrl = state.playState.currentAlbumArtworkUrl
    ..currentAlbumArtworkAverageColor = state.playState.currentAlbumArtworkAverageColor
  ),
  mapDispatchToProps: (dispatch) => (CurrentTrackAlbumArtwork()),
)(
  uiFunction((props) {
    print('inset -200px 0px 60px -130px #${props.currentAlbumArtworkAverageColor}');
    return (Dom.div()
      ..className = 'current-track__art'
      ..style = {
        'boxShadow': 'inset -200px 0px 60px -130px #${props.currentAlbumArtworkAverageColor}',
        'backgroundImage': 'url(${props.currentAlbumArtworkUrl})',
      }
    )();
  }, $CurrentTrackAlbumArtworkConfig, // ignore: undefined_identifier, argument_type_not_assignable
));
