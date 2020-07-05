import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';

import '../sonos_control_actions.dart';

Reducer<MapBuilder<String, bool>> speakersReducer = combineReducers([
  TypedReducer<MapBuilder<String, bool>, SetSpeakersAction>(_setSpeakers),
  TypedReducer<MapBuilder<String, bool>, AddDeviceToZoneAction>(_addDeviceToZone),
  TypedReducer<MapBuilder<String, bool>, RemoveDeviceFromZoneAction>(_removeDeviceFromZone),
]);

MapBuilder<String, bool> _setSpeakers(MapBuilder<String, bool> speakers, SetSpeakersAction action) {
  return action.speakers.toBuilder();
}

MapBuilder<String, bool> _addDeviceToZone(MapBuilder<String, bool> speakers, AddDeviceToZoneAction action) {
  return speakers
    ..[action.deviceName] = true;
}

MapBuilder<String, bool> _removeDeviceFromZone(MapBuilder<String, bool> speakers, RemoveDeviceFromZoneAction action) {
  return speakers
    ..[action.deviceName] = false;
}