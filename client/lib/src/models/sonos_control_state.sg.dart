import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:sonos_control_dart/src/models/music_library.sg.dart';
import 'package:sonos_control_dart/src/models/play_state.sg.dart';

part 'sonos_control_state.sg.g.dart';

abstract class SonosControlState implements Built<SonosControlState, SonosControlStateBuilder> {
  PlayState get playState;

  MusicLibrary get musicLibrary;

  BuiltMap<String, bool> get speakers;

  factory SonosControlState([void Function(SonosControlStateBuilder) updates]) = _$SonosControlState;
  SonosControlState._();
}