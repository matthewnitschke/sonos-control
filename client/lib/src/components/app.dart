import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/components/current_track_album_artwork.dart';
import 'package:sonos_control_dart/src/components/current_track_info.dart';
import 'package:sonos_control_dart/src/components/style_injector.dart';
import 'package:sonos_control_dart/src/components/utils/panel.dart';
import 'package:sonos_control_dart/src/components/playback_control.dart';
import 'package:sonos_control_dart/src/components/room_manager.dart';
import 'package:sonos_control_dart/src/components/spotify_library.dart';
import 'package:sonos_control_dart/src/components/volume_slider.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';

part 'app.over_react.g.dart';

mixin AppProps on UiProps {
  String backgroundColor;
}

UiFactory<AppProps> App = connect<SonosControlState, AppProps>(
  mapStateToProps: (state) => (App()
    ..backgroundColor = state.playState.currentAlbumArtworkAverageColor
  ),
  mapDispatchToProps: (dispatch) => (App()),
)(
  uiFunction((props) {
    return (Dom.div()
      ..className = 'main-container'
      ..style = {
        'backgroundColor': '#${props.backgroundColor}'
      }
    )(
      StyleInjector()(),
      (Panel()
        ..position = 'left'
      )(
        RoomManager()(),

        (Dom.div()
          ..className = 'panel-footer'
        )(
          (Dom.i()
            ..className = 'fas fa-2x fa-sync-alt'
            ..onClick = ((_) {
              window.location.reload();
            })
          )()
        )
      ),

      CurrentTrackAlbumArtwork()(),

      (Dom.div()
        ..className = 'right-panel'
      )(
        CurrentTrackInfo()(),
        PlaybackControl()(),
        VolumeSlider()(),
      ),

      (Panel()
        ..position = 'right'
      )(
        SpotifyLibrary()()
      ),
    );
  }, $AppConfig, // ignore: undefined_identifier, argument_type_not_assignable
));