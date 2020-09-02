import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';

part 'volume_slider.over_react.g.dart';

mixin VolumeSliderProps on UiProps {
  int currentVolume;
  void Function(int) onVolumeChange;
}

UiFactory<VolumeSliderProps> VolumeSlider = connect<SonosControlState, VolumeSliderProps>(
  mapStateToProps: (state) => (VolumeSlider()
    ..currentVolume = state.playState.volume
  ),
  mapDispatchToProps: (dispatch) => (VolumeSlider()
    ..onVolumeChange = ((newVolume) => dispatch(SetVolumeAction(newVolume)))
  ),
)(
  uiFunction((props) {
     void _handleRangeChange(SyntheticFormEvent event) {
      int newVolume = int.parse(event.target.value);
      props.onVolumeChange(newVolume);
    }

    return (Dom.div()
      ..className = 'volume-slider'
    )(
      (Dom.input()
        ..type = 'range'
        ..min = 1
        ..max = 100
        ..value = props.currentVolume
        ..onChange = _handleRangeChange
      )()
    );
  }, $VolumeSliderConfig, // ignore: undefined_identifier, argument_type_not_assignable
));
