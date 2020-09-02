import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';

part 'current_track_info.over_react.g.dart';

mixin CurrentTrackInfoProps on UiProps {
  String currentTrackName;
  String currentArtistName;
}

UiFactory<CurrentTrackInfoProps> CurrentTrackInfo = connect<SonosControlState, CurrentTrackInfoProps>(
  mapStateToProps: (state) => (CurrentTrackInfo()
    ..currentTrackName = state.playState.currentTrackName
    ..currentArtistName = state.playState.currentArtistName
  ),
)(
  uiFunction((props) {
    return (Dom.div()
      ..className = 'current-track__desc'
    )(
      (Dom.div()
        ..className = 'track-name'
      )(props.currentTrackName),
      (Dom.div()
        ..className = 'artist-name'
      )(props.currentArtistName),
    );
  }, $CurrentTrackInfoConfig, // ignore: undefined_identifier, argument_type_not_assignable
));
