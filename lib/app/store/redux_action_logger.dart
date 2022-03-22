import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dbp_flutter_course/app/app_state.dart';

class ReduxActionLogger extends ActionObserver<AppState> {
  @override
  void observe(ReduxAction action, int dispatchCount, {bool ini = false}) {
    if (ini) {
      // ignore: avoid_print
      print('$action');
    }
  }
}
