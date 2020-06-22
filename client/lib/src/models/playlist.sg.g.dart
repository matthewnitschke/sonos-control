// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Playlist extends Playlist {
  @override
  final String name;
  @override
  final String uri;

  factory _$Playlist([void Function(PlaylistBuilder) updates]) =>
      (new PlaylistBuilder()..update(updates)).build();

  _$Playlist._({this.name, this.uri}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Playlist', 'name');
    }
    if (uri == null) {
      throw new BuiltValueNullFieldError('Playlist', 'uri');
    }
  }

  @override
  Playlist rebuild(void Function(PlaylistBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlaylistBuilder toBuilder() => new PlaylistBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Playlist && name == other.name && uri == other.uri;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), uri.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Playlist')
          ..add('name', name)
          ..add('uri', uri))
        .toString();
  }
}

class PlaylistBuilder implements Builder<Playlist, PlaylistBuilder> {
  _$Playlist _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _uri;
  String get uri => _$this._uri;
  set uri(String uri) => _$this._uri = uri;

  PlaylistBuilder();

  PlaylistBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _uri = _$v.uri;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Playlist other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Playlist;
  }

  @override
  void update(void Function(PlaylistBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Playlist build() {
    final _$result = _$v ?? new _$Playlist._(name: name, uri: uri);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
