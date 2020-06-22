import 'package:built_value/built_value.dart';

part 'speaker.sg.g.dart';

abstract class Speaker implements Built<Speaker, SpeakerBuilder> {
  String get name;
  
  bool get isMainGroup;

  factory Speaker([void Function(SpeakerBuilder) updates]) = _$Speaker;
  Speaker._();
}