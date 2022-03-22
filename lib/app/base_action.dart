import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dbp_flutter_course/app/app_state.dart';
import 'package:dbp_flutter_course/app/operations.dart';

abstract class BaseAction extends Action<AppState> {
  BaseAction({
    bool isRefreshing = false,
  }) : super(isRefreshing: isRefreshing);

  @override
  Operation? get operationKey => null;
}
