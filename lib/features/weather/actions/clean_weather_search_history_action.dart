import 'dart:async';

import 'package:dbp_flutter_course/app/app_state.dart';
import 'package:dbp_flutter_course/app/base_action.dart';
import 'package:dbp_flutter_course/app/operations.dart';

class CleanWeatherSearchHistoryAction extends BaseAction {
  CleanWeatherSearchHistoryAction();

  @override
  Operation get operationKey => Operation.cleanWeatherSearchHistory;

  @override
  FutureOr<AppState?> reduce() async {
    return state.rebuild(
      (s) => s..weather.searchHistory.clear(),
    );
  }
}
