// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_state.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PlayState extends PlayState {
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
  final String currentAlbumArtworkAverageColor;

  factory _$PlayState([void Function(PlayStateBuilder) updates]) =>
      (new PlayStateBuilder()..update(updates)).build();

  _$PlayState._(
      {this.isPlaying,
      this.volume,
      this.currentTrackName,
      this.currentArtistName,
      this.currentAlbumArtworkUrl,
      this.currentAlbumArtworkAverageColor})
      : super._() {
    if (isPlaying == null) {
      throw new BuiltValueNullFieldError('PlayState', 'isPlaying');
    }
    if (volume == null) {
      throw new BuiltValueNullFieldError('PlayState', 'volume');
    }
    if (currentTrackName == null) {
      throw new BuiltValueNullFieldError('PlayState', 'currentTrackName');
    }
    if (currentArtistName == null) {
      throw new BuiltValueNullFieldError('PlayState', 'currentArtistName');
    }
    if (currentAlbumArtworkUrl == null) {
      throw new BuiltValueNullFieldError('PlayState', 'currentAlbumArtworkUrl');
    }
    if (currentAlbumArtworkAverageColor == null) {
      throw new BuiltValueNullFieldError(
          'PlayState', 'currentAlbumArtworkAverageColor');
    }
  }

  @override
  PlayState rebuild(void Function(PlayStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayStateBuilder toBuilder() => new PlayStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlayState &&
        isPlaying == other.isPlaying &&
        volume == other.volume &&
        currentTrackName == other.currentTrackName &&
        currentArtistName == other.currentArtistName &&
        currentAlbumArtworkUrl == other.currentAlbumArtworkUrl &&
        currentAlbumArtworkAverageColor ==
            other.currentAlbumArtworkAverageColor;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, isPlaying.hashCode), volume.hashCode),
                    currentTrackName.hashCode),
                currentArtistName.hashCode),
            currentAlbumArtworkUrl.hashCode),
        currentAlbumArtworkAverageColor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PlayState')
          ..add('isPlaying', isPlaying)
          ..add('volume', volume)
          ..add('currentTrackName', currentTrackName)
          ..add('currentArtistName', currentArtistName)
          ..add('currentAlbumArtworkUrl', currentAlbumArtworkUrl)
          ..add('currentAlbumArtworkAverageColor',
              currentAlbumArtworkAverageColor))
        .toString();
  }
}

class PlayStateBuilder implements Builder<PlayState, PlayStateBuilder> {
  _$PlayState _$v;

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

  String _currentAlbumArtworkAverageColor;
  String get currentAlbumArtworkAverageColor =>
      _$this._currentAlbumArtworkAverageColor;
  set currentAlbumArtworkAverageColor(String currentAlbumArtworkAverageColor) =>
      _$this._currentAlbumArtworkAverageColor = currentAlbumArtworkAverageColor;

  PlayStateBuilder();

  PlayStateBuilder get _$this {
    if (_$v != null) {
      _isPlaying = _$v.isPlaying;
      _volume = _$v.volume;
      _currentTrackName = _$v.currentTrackName;
      _currentArtistName = _$v.currentArtistName;
      _currentAlbumArtworkUrl = _$v.currentAlbumArtworkUrl;
      _currentAlbumArtworkAverageColor = _$v.currentAlbumArtworkAverageColor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlayState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PlayState;
  }

  @override
  void update(void Function(PlayStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlayState build() {
    final _$result = _$v ??
        new _$PlayState._(
            isPlaying: isPlaying,
            volume: volume,
            currentTrackName: currentTrackName,
            currentArtistName: currentArtistName,
            currentAlbumArtworkUrl: currentAlbumArtworkUrl,
            currentAlbumArtworkAverageColor: currentAlbumArtworkAverageColor);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
