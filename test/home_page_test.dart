import 'package:built_collection/built_collection.dart';
import 'package:dbp_flutter_course/app/app_state.dart';
import 'package:dbp_flutter_course/models/network/responses/city_item/city_item.dart';
import 'package:dbp_flutter_course/models/network/responses/location_point/location_point.dart';
import 'package:dbp_flutter_course/presentation/home/home_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'mocks/weather_day_mock.dart';
import 'utils/devices.dart';
import 'utils/setup.dart';
import 'utils/test_state_widget.dart';

void main() {
  setUpAll(() async {
    await setupEnvironment();
  });

  const path = 'home_page';

  testGoldens(
    'Home Page should look correct',
    (tester) async {
      CityItem? cityItemMock;
      final state = AppState.initial().rebuild(
        (b) => b
          ..weather.currentCity = cityItemMock
          ..weather.today = weatherDayMock
          ..weather.nextDays = ListBuilder(nexDaysMock)
          ..geolocation.point = LocationPoint(lat: 0, lon: 0),
      );

      const page = HomePage();

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
