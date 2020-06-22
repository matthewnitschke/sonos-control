// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Speaker extends Speaker {
  @override
  final String name;
  @override
  final bool isMainGroup;

  factory _$Speaker([void Function(SpeakerBuilder) updates]) =>
      (new SpeakerBuilder()..update(updates)).build();

  _$Speaker._({this.name, this.isMainGroup}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Speaker', 'name');
    }
    if (isMainGroup == null) {
      throw new BuiltValueNullFieldError('Speaker', 'isMainGroup');
    }
  }

  @override
  Speaker rebuild(void Function(SpeakerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpeakerBuilder toBuilder() => new SpeakerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Speaker &&
        name == other.name &&
        isMainGroup == other.isMainGroup;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), isMainGroup.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Speaker')
          ..add('name', name)
          ..add('isMainGroup', isMainGroup))
        .toString();
  }
}

class SpeakerBuilder implements Builder<Speaker, SpeakerBuilder> {
  _$Speaker _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _isMainGroup;
  bool get isMainGroup => _$this._isMainGroup;
  set isMainGroup(bool isMainGroup) => _$this._isMainGroup = isMainGroup;

  SpeakerBuilder();

  SpeakerBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _isMainGroup = _$v.isMainGroup;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Speaker other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Speaker;
  }

  @override
  void update(void Function(SpeakerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Speaker build() {
    final _$result =
        _$v ?? new _$Speaker._(name: name, isMainGroup: isMainGroup);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
