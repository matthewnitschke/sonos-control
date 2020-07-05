import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';

part 'volume_slider.over_react.g.dart';

UiFactory<VolumeSliderProps> VolumeSlider = connect<SonosControlState, VolumeSliderProps>(
  mapStateToProps: (state) => (VolumeSlider()
    ..currentVolume = state.playState.volume
  ),
  mapDispatchToProps: (dispatch) => (VolumeSlider()
    ..onVolumeChange = ((newVolume) => dispatch(SetVolumeAction(newVolume)))
  ),
)(_$VolumeSlider); // ignore: undefined_identifier

mixin VolumeSliderProps on UiProps {
  int currentVolume;
  void Function(int) onVolumeChange;
}

class VolumeSliderComponent extends UiComponent2<VolumeSliderProps> {
  @override
  Map get defaultProps => (newProps());

  @override
  ReactElement render() {
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
  }

  void _handleRangeChange(SyntheticFormEvent event) {
    int newVolume = int.parse(event.target.value);

    props.onVolumeChange(newVolume);
  }
}