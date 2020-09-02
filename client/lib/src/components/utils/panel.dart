import 'package:over_react/over_react.dart';

part 'panel.over_react.g.dart'; // ignore: uri_has_not_been_generated

mixin PanelProps on UiProps {
  String position;
}

UiFactory<PanelProps> Panel = uiFunction(
    (props) {
      final isExpanded = useState(false);

      ReactElement _renderPanelTrigger() {
        return (Dom.div()
          ..className = 'panel-trigger'
          ..onClick = ((_) => isExpanded.setWithUpdater((prev) => !prev))
        )(
          (Dom.i()..className='fas fa-circle')(),
          (Dom.i()..className='fas fa-circle')(),
          (Dom.i()..className='fas fa-circle')(),
        );
      }

      return (Dom.div()
        ..className = 'panel panel-${props.position}'
      )(
        props.position == 'right' ? _renderPanelTrigger() : null,

        (Dom.div()
          ..className='panel-content'
          ..style = {'display': isExpanded.value ? 'initial' : 'none'}
        )(props.children),

        props.position == 'left' ? _renderPanelTrigger() : null
      );
    }, 
    $PanelConfig, // ignore: undefined_identifier, argument_type_not_assignable
);