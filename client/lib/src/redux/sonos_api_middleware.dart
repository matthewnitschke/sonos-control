import 'package:redux/redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';
import 'package:sonos_control_dart/src/utils/sonos_api.dart';

class SonosAPIMiddleware {
  final SonosActionAPI _sonosActionApi;

  SonosAPIMiddleware(this._sonosActionApi);

  List<Middleware<SonosControlState>> get middleware => [
    TypedMiddleware<SonosControlState, ServerSyncedAction>(_handleServerCommitedAction),
    TypedMiddleware<SonosControlState, NextTrackAction>(_handleNextTrackAction),
    TypedMiddleware<SonosControlState, PreviousTrackAction>(_handlePreviousTrackAction),
    TypedMiddleware<SonosControlState, PlayURIAction>(_handlePlayURIAction),
  ];

  void _handleServerCommitedAction(Store<SonosControlState> store, ServerSyncedAction action, NextDispatcher next) {
    if (!action.sendToServer) {
      next(action);
      return;
    }

    if (action is SetPlayStateAction) {
      _sonosActionApi.setPlayState(action.isPlaying);
    } else if (action is SetVolumeAction) {
      _sonosActionApi.setVolume(action.volume);
    } else if (action is AddDeviceToZoneAction) {
      _sonosActionApi.addDeviceToZone(action.deviceName);
    } else if (action is RemoveDeviceFromZoneAction) {
      _sonosActionApi.removeDeviceFromZone(action.deviceName);
    }

    next(action);
  }

  void _handleNextTrackAction(_, NextTrackAction action, __) {
    _sonosActionApi.nextTrack();
  }

  void _handlePreviousTrackAction(_, PreviousTrackAction action, __) {
    _sonosActionApi.previousTrack();
  }

  void _handlePlayURIAction(_, PlayURIAction action, __) {
    _sonosActionApi.playURI(action.uri);
  }
}
