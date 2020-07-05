// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sonos_control_state.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SonosControlState extends SonosControlState {
  @override
  final PlayState playState;
  @override
  final MusicLibrary musicLibrary;
  @override
  final BuiltMap<String, bool> speakers;

  factory _$SonosControlState(
          [void Function(SonosControlStateBuilder) updates]) =>
      (new SonosControlStateBuilder()..update(updates)).build();

  _$SonosControlState._({this.playState, this.musicLibrary, this.speakers})
      : super._() {
    if (playState == null) {
      throw new BuiltValueNullFieldError('SonosControlState', 'playState');
    }
    if (musicLibrary == null) {
      throw new BuiltValueNullFieldError('SonosControlState', 'musicLibrary');
    }
    if (speakers == null) {
      throw new BuiltValueNullFieldError('SonosControlState', 'speakers');
    }
  }

  @override
  SonosControlState rebuild(void Function(SonosControlStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SonosControlStateBuilder toBuilder() =>
      new SonosControlStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SonosControlState &&
        playState == other.playState &&
        musicLibrary == other.musicLibrary &&
        speakers == other.speakers;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, playState.hashCode), musicLibrary.hashCode),
        speakers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SonosControlState')
          ..add('playState', playState)
          ..add('musicLibrary', musicLibrary)
          ..add('speakers', speakers))
        .toString();
  }
}

class SonosControlStateBuilder
    implements Builder<SonosControlState, SonosControlStateBuilder> {
  _$SonosControlState _$v;

  PlayStateBuilder _playState;
  PlayStateBuilder get playState =>
      _$this._playState ??= new PlayStateBuilder();
  set playState(PlayStateBuilder playState) => _$this._playState = playState;

  MusicLibraryBuilder _musicLibrary;
  MusicLibraryBuilder get musicLibrary =>
      _$this._musicLibrary ??= new MusicLibraryBuilder();
  set musicLibrary(MusicLibraryBuilder musicLibrary) =>
      _$this._musicLibrary = musicLibrary;

  MapBuilder<String, bool> _speakers;
  MapBuilder<String, bool> get speakers =>
      _$this._speakers ??= new MapBuilder<String, bool>();
  set speakers(MapBuilder<String, bool> speakers) =>
      _$this._speakers = speakers;

  SonosControlStateBuilder();

  SonosControlStateBuilder get _$this {
    if (_$v != null) {
      _playState = _$v.playState?.toBuilder();
      _musicLibrary = _$v.musicLibrary?.toBuilder();
      _speakers = _$v.speakers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SonosControlState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SonosControlState;
  }

  @override
  void update(void Function(SonosControlStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SonosControlState build() {
    _$SonosControlState _$result;
    try {
      _$result = _$v ??
          new _$SonosControlState._(
              playState: playState.build(),
              musicLibrary: musicLibrary.build(),
              speakers: speakers.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'playState';
        playState.build();
        _$failedField = 'musicLibrary';
        musicLibrary.build();
        _$failedField = 'speakers';
        speakers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SonosControlState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
