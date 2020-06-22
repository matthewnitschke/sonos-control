import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';

part 'current_track_info.over_react.g.dart';

UiFactory<CurrentTrackInfoProps> CurrentTrackInfo = connect<SonosControlState, CurrentTrackInfoProps>(
  mapStateToProps: (state) => (CurrentTrackInfo()
    ..currentTrackName = state.currentTrackName
    ..currentArtistName = state.currentArtistName
  ),
)(_$CurrentTrackInfo); // ignore: undefined_identifier

mixin CurrentTrackInfoProps on UiProps {
  String currentTrackName;
  String currentArtistName;
}

class CurrentTrackInfoComponent extends UiComponent2<CurrentTrackInfoProps> {
  @override
  Map get defaultProps => (newProps());

  @override
  ReactElement render() {
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
  }
}