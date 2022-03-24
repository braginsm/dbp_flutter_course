import 'package:dbp_flutter_course/app/app_state.dart';
import 'package:dbp_flutter_course/presentation/search/search_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'mocks/city_item_mock.dart';
import 'utils/devices.dart';
import 'utils/setup.dart';
import 'utils/test_state_widget.dart';

void main() {
  setUpAll(() async {
    await setupEnvironment();
  });

  const path = 'search_page';

  testGoldens(
    'Search Page should look correct',
    (tester) async {
      final state = AppState.initial().rebuild(
        (b) => b.weather..currentCity = cityItemMock,
      );

      const page = SearchPage();

      await tester.pumpWidgetBuilder(
        page,
        wrapper: (child) => TestStateWidget(
          initialState: state,
          child: child,
        ),
      );

      await multiScreenGolden(
        tester,
        '$path/$path',
        devices: devicesWithDifferentTextScales(),
      );
    },
  );
}
