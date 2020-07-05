import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';

part 'playback_control.over_react.g.dart';

UiFactory<PlaybackControlProps> PlaybackControl = connect<SonosControlState, PlaybackControlProps>(
  mapStateToProps: (state) => (PlaybackControl()
    ..isPlaying = state.playState.isPlaying
  ),
  mapDispatchToProps: (dispatch) => (PlaybackControl()
    ..onPlayPauseButtonClick = ((isPlaying) => dispatch(SetPlayStateAction(isPlaying)))
    ..onNextButtonClick = (() => dispatch(NextTrackAction()))
    ..onPreviousButtonClick = (() => dispatch(NextTrackAction()))
  ),
)(_$PlaybackControl); // ignore: undefined_identifier

mixin PlaybackControlProps on UiProps {
  bool isPlaying;

  void Function(bool) onPlayPauseButtonClick;

  void Function() onNextButtonClick;
  void Function() onPreviousButtonClick;
}

class PlaybackControlComponent extends UiComponent2<PlaybackControlProps> {
  @override
  Map get defaultProps => (newProps());

  @override
  ReactElement render() {
    return (Dom.div()
      ..className = 'playback-control'
    )(
      (Dom.i()
        ..className='fas fa-chevron-left fa-3x'
        ..onClick = ((_) => props.onNextButtonClick())
      )(),
      _renderPlayPauseButton(),
      (Dom.i()
        ..className='fas fa-chevron-right fa-3x'
        ..onClick = ((_) => props.onPreviousButtonClick())
      )(),
    );
  }


  ReactElement _renderPlayPauseButton(){
    if (props.isPlaying) {
      return (Dom.i()
        ..className='fas fa-pause fa-3x'
        ..onClick = ((_) => props.onPlayPauseButtonClick(false))
      )();
    }

    return (Dom.i()
      ..className='fas fa-play fa-3x'
      ..onClick = ((_) => props.onPlayPauseButtonClick(true))
    )();
  }
}