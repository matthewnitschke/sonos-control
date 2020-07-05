import 'package:redux/redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';


Reducer<SonosControlState> sonosControlReducer = combineReducers([
  TypedReducer<SonosControlState, SetSpeakersAction>(_setSpeakers),
  TypedReducer<SonosControlState, AddDeviceToZoneAction>(_addDeviceToZone),
  TypedReducer<SonosControlState, RemoveDeviceFromZoneAction>(_removeDeviceFromZone),
]);

SonosControlState _setSpeakers(SonosControlState state, SetSpeakersAction action) {
  return state.rebuild((b) => b
    ..speakers = action.speakers.toBuilder()
  );
}

SonosControlState _addDeviceToZone(SonosControlState state, AddDeviceToZoneAction action) {
  return state.rebuild((b) => b
    ..speakers[action.deviceName] = true
  );
}

SonosControlState _removeDeviceFromZone(SonosControlState state, RemoveDeviceFromZoneAction action) {
  return state.rebuild((b) => b
    ..speakers[action.deviceName] = false
  );
}