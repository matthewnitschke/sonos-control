import 'package:over_react/over_react.dart';

part 'panel.over_react.g.dart';

UiFactory<PanelProps> Panel = _$Panel; // ignore: undefined_identifier

mixin PanelProps on UiProps {
  String position;
}

mixin PanelState on UiState {
  bool isExpanded;
}

class PanelComponent extends UiStatefulComponent2<PanelProps, PanelState> {
  @override
  get defaultProps => (newProps());

  @override
  get initialState => (newState()
    ..isExpanded = false
  );

  @override
  render() {
    return (Dom.div()
      ..className = 'panel panel-${props.position}'
    )(
      props.position == 'right' ? _renderPanelTrigger() : null,

      (Dom.div()
        ..className='panel-content'
        ..style = {'display': state.isExpanded ? 'initial' : 'none'}
      )(props.children),

      props.position == 'left' ? _renderPanelTrigger() : null
    );
  }

  ReactElement _renderPanelTrigger() {
    return (Dom.div()
      ..className = 'panel-trigger'
      ..onClick = ((_) => setState(newState()..isExpanded = !state.isExpanded))
    )(
      (Dom.i()..className='fas fa-circle')(),
      (Dom.i()..className='fas fa-circle')(),
      (Dom.i()..className='fas fa-circle')(),
    );
  }
}