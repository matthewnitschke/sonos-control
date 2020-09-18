import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:sonos_control_dart/src/models/sonos_control_state.sg.dart';
import 'package:sonos_control_dart/src/utils/color.dart';

part 'style_injector.over_react.g.dart';

mixin StyleInjectorProps on UiProps {
  String backgroundColor;
}

UiFactory<StyleInjectorProps> StyleInjector = connect<SonosControlState, StyleInjectorProps>(
  mapStateToProps: (state) => (StyleInjector()
    ..backgroundColor = state.playState.currentAlbumArtworkAverageColor
  ),
  mapDispatchToProps: (dispatch) => (StyleInjector()),
)(
  uiFunction((props) {
    final isDark = isDarkFg(props.backgroundColor);
    return Dom.style()("""
      :root { 
        --main-fg-color: ${isDark ? '#393b44' : '#f1f3f8'}; 
        --secondary-fg-color: ${isDark ? '#8d93ab' : '#d6e0f0'}
      }
    """);
  }, $StyleInjectorConfig, // ignore: undefined_identifier, argument_type_not_assignable
));