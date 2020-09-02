import 'dart:html';

import 'package:over_react/components.dart';
import 'package:react/react_dom.dart' as react_dom;

import 'package:sonos_control_dart/sonos-control.dart';

Future main() async {
  final module = SonosControlModule();
  
  react_dom.render(
    ErrorBoundary()(
      module.content()
    ),
    querySelector('#app')
  );
}