// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sonos_control_state.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SonosControlState extends SonosControlState {
  @override
  final bool isPlaying;
  @override
  final int volume;
  @override
  final String currentTrackName;
  @override
  final String currentArtistName;
  @override
  final String currentAlbumArtworkUrl;
  @override
  final BuiltList<Playlist> playlists;
  @override
  final BuiltMap<String, bool> speakers;

  factory _$SonosControlState(
          [void Function(SonosControlStateBuilder) updates]) =>
      (new SonosControlStateBuilder()..update(updates)).build();

  _$SonosControlState._(
      {this.isPlaying,
      this.volume,
      this.currentTrackName,
      this.currentArtistName,
      this.currentAlbumArtworkUrl,
      this.playlists,
      this.speakers})
      : super._() {
    if (isPlaying == null) {
      throw new BuiltValueNullFieldError('SonosControlState', 'isPlaying');
    }
    if (volume == null) {
      throw new BuiltValueNullFieldError('SonosControlState', 'volume');
    }
    if (currentTrackName == null) {
      throw new BuiltValueNullFieldError(
          'SonosControlState', 'currentTrackName');
    }
    if (currentArtistName == null) {
      throw new BuiltValueNullFieldError(
          'SonosControlState', 'currentArtistName');
    }
    if (currentAlbumArtworkUrl == null) {
      throw new BuiltValueNullFieldError(
          'SonosControlState', 'currentAlbumArtworkUrl');
    }
    if (playlists == null) {
      throw new BuiltValueNullFieldError('SonosControlState', 'playlists');
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
        isPlaying == other.isPlaying &&
        volume == other.volume &&
        currentTrackName == other.currentTrackName &&
        currentArtistName == other.currentArtistName &&
        currentAlbumArtworkUrl == other.currentAlbumArtworkUrl &&
        playlists == other.playlists &&
        speakers == other.speakers;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, isPlaying.hashCode), volume.hashCode),
                        currentTrackName.hashCode),
                    currentArtistName.hashCode),
                currentAlbumArtworkUrl.hashCode),
            playlists.hashCode),
        speakers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SonosControlState')
          ..add('isPlaying', isPlaying)
          ..add('volume', volume)
          ..add('currentTrackName', currentTrackName)
          ..add('currentArtistName', currentArtistName)
          ..add('currentAlbumArtworkUrl', currentAlbumArtworkUrl)
          ..add('playlists', playlists)
          ..add('speakers', speakers))
        .toString();
  }
}

class SonosControlStateBuilder
    implements Builder<SonosControlState, SonosControlStateBuilder> {
  _$SonosControlState _$v;

  bool _isPlaying;
  bool get isPlaying => _$this._isPlaying;
  set isPlaying(bool isPlaying) => _$this._isPlaying = isPlaying;

  int _volume;
  int get volume => _$this._volume;
  set volume(int volume) => _$this._volume = volume;

  String _currentTrackName;
  String get currentTrackName => _$this._currentTrackName;
  set currentTrackName(String currentTrackName) =>
      _$this._currentTrackName = currentTrackName;

  String _currentArtistName;
  String get currentArtistName => _$this._currentArtistName;
  set currentArtistName(String currentArtistName) =>
      _$this._currentArtistName = currentArtistName;

  String _currentAlbumArtworkUrl;
  String get currentAlbumArtworkUrl => _$this._currentAlbumArtworkUrl;
  set currentAlbumArtworkUrl(String currentAlbumArtworkUrl) =>
      _$this._currentAlbumArtworkUrl = currentAlbumArtworkUrl;

  ListBuilder<Playlist> _playlists;
  ListBuilder<Playlist> get playlists =>
      _$this._playlists ??= new ListBuilder<Playlist>();
  set playlists(ListBuilder<Playlist> playlists) =>
      _$this._playlists = playlists;

  MapBuilder<String, bool> _speakers;
  MapBuilder<String, bool> get speakers =>
      _$this._speakers ??= new MapBuilder<String, bool>();
  set speakers(MapBuilder<String, bool> speakers) =>
      _$this._speakers = speakers;

  SonosControlStateBuilder();

  SonosControlStateBuilder get _$this {
    if (_$v != null) {
      _isPlaying = _$v.isPlaying;
      _volume = _$v.volume;
      _currentTrackName = _$v.currentTrackName;
      _currentArtistName = _$v.currentArtistName;
      _currentAlbumArtworkUrl = _$v.currentAlbumArtworkUrl;
      _playlists = _$v.playlists?.toBuilder();
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
              isPlaying: isPlaying,
              volume: volume,
              currentTrackName: currentTrackName,
              currentArtistName: currentArtistName,
              currentAlbumArtworkUrl: currentAlbumArtworkUrl,
              playlists: playlists.build(),
              speakers: speakers.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'playlists';
        playlists.build();
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
