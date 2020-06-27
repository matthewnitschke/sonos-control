import 'package:built_collection/built_collection.dart';
import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/models/speaker.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';

part 'room_manager.over_react.g.dart';

UiFactory<RoomManagerProps> RoomManager = connect<SonosControlState, RoomManagerProps>(
  mapStateToProps: (state) => (RoomManager()
    ..speakers = state.speakers
  ),
  mapDispatchToProps: (dispatch) => (RoomManager()
    ..addDevice = ((name) => dispatch(AddDeviceToZoneAction(name)))
    ..removeDevice = ((name) => dispatch(RemoveDeviceFromZoneAction(name)))
  ),
)(_$RoomManager); // ignore: undefined_identifier

mixin RoomManagerProps on UiProps {
  BuiltMap<String, bool> speakers;

  void Function(String deviceName) addDevice;
  void Function(String deviceName) removeDevice;
}

class RoomManagerComponent extends UiComponent2<RoomManagerProps> {
  @override
  Map get defaultProps => (newProps());

  @override
  ReactElement render() {
    return (Dom.div()
      ..className = 'devices-panel'
    )(
      (Dom.div()
        ..className = 'panel-title'
      )('Office'),
      props.speakers.keys.map((speakerName) {
        return (Dom.div()
          ..key = speakerName
        )(
          (Dom.input()
            ..type = 'checkbox'
            ..checked = props.speakers[speakerName]
            ..id = speakerName
            ..onChange = ((e) => _handleCheckboxChange(e, speakerName))
          )(),
          (Dom.label()
            ..htmlFor = speakerName
          )(speakerName),
        );
      }).toList()
    );
  }

  void _handleCheckboxChange(SyntheticFormEvent e, String speakerName) {
    final isChecked = e.target.checked as bool;

    if (isChecked) {
      props.addDevice(speakerName);
    } else {
      props.removeDevice(speakerName);
    }
  }
}