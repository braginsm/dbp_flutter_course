import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dbp_flutter_course/app/app_state.dart';
import 'package:dbp_flutter_course/app/base_action.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef Dispatcher = Future<void> Function(BaseAction);

Dispatcher useDispatcher() {
  final context = useContext();
  final storeProvider = StoreProvider.of<AppState>(context, 'dispatcher');

  return storeProvider.dispatch;
}
