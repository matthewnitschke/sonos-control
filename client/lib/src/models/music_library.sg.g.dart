// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_library.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MusicLibrary extends MusicLibrary {
  @override
  final bool isSpotifyAuthed;
  @override
  final BuiltList<Playlist> playlists;

  factory _$MusicLibrary([void Function(MusicLibraryBuilder) updates]) =>
      (new MusicLibraryBuilder()..update(updates)).build();

  _$MusicLibrary._({this.isSpotifyAuthed, this.playlists}) : super._() {
    if (isSpotifyAuthed == null) {
      throw new BuiltValueNullFieldError('MusicLibrary', 'isSpotifyAuthed');
    }
    if (playlists == null) {
      throw new BuiltValueNullFieldError('MusicLibrary', 'playlists');
    }
  }

  @override
  MusicLibrary rebuild(void Function(MusicLibraryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MusicLibraryBuilder toBuilder() => new MusicLibraryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MusicLibrary &&
        isSpotifyAuthed == other.isSpotifyAuthed &&
        playlists == other.playlists;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isSpotifyAuthed.hashCode), playlists.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MusicLibrary')
          ..add('isSpotifyAuthed', isSpotifyAuthed)
          ..add('playlists', playlists))
        .toString();
  }
}

class MusicLibraryBuilder
    implements Builder<MusicLibrary, MusicLibraryBuilder> {
  _$MusicLibrary _$v;

  bool _isSpotifyAuthed;
  bool get isSpotifyAuthed => _$this._isSpotifyAuthed;
  set isSpotifyAuthed(bool isSpotifyAuthed) =>
      _$this._isSpotifyAuthed = isSpotifyAuthed;

  ListBuilder<Playlist> _playlists;
  ListBuilder<Playlist> get playlists =>
      _$this._playlists ??= new ListBuilder<Playlist>();
  set playlists(ListBuilder<Playlist> playlists) =>
      _$this._playlists = playlists;

  MusicLibraryBuilder();

  MusicLibraryBuilder get _$this {
    if (_$v != null) {
      _isSpotifyAuthed = _$v.isSpotifyAuthed;
      _playlists = _$v.playlists?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MusicLibrary other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MusicLibrary;
  }

  @override
  void update(void Function(MusicLibraryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MusicLibrary build() {
    _$MusicLibrary _$result;
    try {
      _$result = _$v ??
          new _$MusicLibrary._(
              isSpotifyAuthed: isSpotifyAuthed, playlists: playlists.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'playlists';
        playlists.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MusicLibrary', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
