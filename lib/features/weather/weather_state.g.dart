// GENERATED CODE - DO NOT MODIFY BY HAND

part of weather_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WeatherState extends WeatherState {
  @override
  final CityItem? currentCity;
  @override
  final WeatherDay today;
  @override
  final BuiltList<WeatherDay> nextDays;
  @override
  final BuiltList<String> searchHistory;

  factory _$WeatherState([void Function(WeatherStateBuilder)? updates]) =>
      (new WeatherStateBuilder()..update(updates)).build();

  _$WeatherState._(
      {this.currentCity,
      required this.today,
      required this.nextDays,
      required this.searchHistory})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(today, 'WeatherState', 'today');
    BuiltValueNullFieldError.checkNotNull(nextDays, 'WeatherState', 'nextDays');
    BuiltValueNullFieldError.checkNotNull(
        searchHistory, 'WeatherState', 'searchHistory');
  }

  @override
  WeatherState rebuild(void Function(WeatherStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStateBuilder toBuilder() => new WeatherStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherState &&
        currentCity == other.currentCity &&
        today == other.today &&
        nextDays == other.nextDays &&
        searchHistory == other.searchHistory;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, currentCity.hashCode), today.hashCode),
            nextDays.hashCode),
        searchHistory.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WeatherState')
          ..add('currentCity', currentCity)
          ..add('today', today)
          ..add('nextDays', nextDays)
          ..add('searchHistory', searchHistory))
        .toString();
  }
}

class WeatherStateBuilder
    implements Builder<WeatherState, WeatherStateBuilder> {
  _$WeatherState? _$v;

  CityItem? _currentCity;
  CityItem? get currentCity => _$this._currentCity;
  set currentCity(CityItem? currentCity) => _$this._currentCity = currentCity;

  WeatherDay? _today;
  WeatherDay? get today => _$this._today;
  set today(WeatherDay? today) => _$this._today = today;

  ListBuilder<WeatherDay>? _nextDays;
  ListBuilder<WeatherDay> get nextDays =>
      _$this._nextDays ??= new ListBuilder<WeatherDay>();
  set nextDays(ListBuilder<WeatherDay>? nextDays) =>
      _$this._nextDays = nextDays;

  ListBuilder<String>? _searchHistory;
  ListBuilder<String> get searchHistory =>
      _$this._searchHistory ??= new ListBuilder<String>();
  set searchHistory(ListBuilder<String>? searchHistory) =>
      _$this._searchHistory = searchHistory;

  WeatherStateBuilder();

  WeatherStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentCity = $v.currentCity;
      _today = $v.today;
      _nextDays = $v.nextDays.toBuilder();
      _searchHistory = $v.searchHistory.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherState;
  }

  @override
  void update(void Function(WeatherStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WeatherState build() {
    _$WeatherState _$result;
    try {
      _$result = _$v ??
          new _$WeatherState._(
              currentCity: currentCity,
              today: BuiltValueNullFieldError.checkNotNull(
                  today, 'WeatherState', 'today'),
              nextDays: nextDays.build(),
              searchHistory: searchHistory.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nextDays';
        nextDays.build();
        _$failedField = 'searchHistory';
        searchHistory.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WeatherState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
