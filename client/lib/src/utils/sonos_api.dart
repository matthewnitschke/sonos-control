import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/redux/sonos_control_actions.dart';
import 'package:sonos_control_dart/src/utils/socket.dart';



int _playStatePacketTracker = 0;

Timer _topoTimeout;
int _topoPacketTracker = 0;

// due to the amount of requests volume gets, a timeout is a better
// method for preventing request debounces
bool _acceptVolumePackets = true;
Timer _volumePacketTimeout;
class SonosEventAPI {
  Store<SonosControlState> _store;

  SonosEventAPI(this._store) {
    final socket = ServerSocket().socket;

    socket.on('play-state-change', (res) {
      if (_playStatePacketTracker <= 0) {
        
        final playState = res as String;

        // we dont care about the transitioning state
        if (playState == 'transitioning') {
          return;
        }

        final isPlaying = res as String == 'playing';

        _store.dispatch(SetPlayStateAction(isPlaying, sendToServer: false));

        // just to verify we all good
        _playStatePacketTracker = 0;
      } else {
        _playStatePacketTracker--;
      }
    });

    socket.on('volume-change', (res) {
      if (_acceptVolumePackets) {
        final volume = res as int;
        _store.dispatch(SetVolumeAction(volume, sendToServer: false));
      }
    });

    socket.on('current-track-change', (res) {
      if (res == null) {
        // no track is currently selected or running 
        // TODO: react to this somehow letting the frontend know
      } else {
        final data = res as Map<String, dynamic>;
        _store.dispatch(SetCurrentTrackAction(
          currentTrackName: data['title'] as String,
          currentArtistName: data['artist'] as String,
          currentAlbumArtworkUrl: data['albumArtURI'] as String,
          currentAlbumArtworkAverageColor: data['averageColor'] as String,
        ));
      }

    });

    socket.on('topology-change', (res) {
      if (res == null) return;

      if (_topoPacketTracker <= 0) {
        final speakers = BuiltMap<String, bool>(res);

        _store.dispatch(SetSpeakersAction(speakers));

        _topoPacketTracker = 0;
      } else {
        _topoPacketTracker--;
      }
    });
  }
}

class SonosActionAPI {
  final IO.Socket _socket;

  SonosActionAPI() : _socket = ServerSocket().socket;

  void setPlayState(bool isPlaying) {
    _playStatePacketTracker++;
    _socket.emit('setIsPlaying', isPlaying);
  }

  void nextTrack() => _socket.emit('next');
  
  void previousTrack() => _socket.emit('previous');

  void setVolume(int volume) {
    _acceptVolumePackets = false;
    _volumePacketTimeout?.cancel();
    _volumePacketTimeout = Timer(Duration(seconds: 3), () {
      _acceptVolumePackets = true;
    });

    _socket.emit('set-volume', volume);
  }

  void playURI(String uri) => _socket.emit('play-uri', uri);

  void addDeviceToZone(String deviceName) {
    _topoTimeout?.cancel();
    _topoTimeout = Timer(Duration(seconds: 5), () => _topoPacketTracker = 0);
    _topoPacketTracker++;
    _socket.emit('add-device-to-zone', deviceName);
  }

  void removeDeviceFromZone(String deviceName) {
    _topoTimeout?.cancel();
    _topoTimeout = Timer(Duration(seconds: 5), () => _topoPacketTracker = 0);
    _topoPacketTracker++;
    _socket.emit('remove-device-from-zone', deviceName);
  }
}