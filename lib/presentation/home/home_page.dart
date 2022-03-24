import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dbp_flutter_course/app/app_state.dart';
import 'package:dbp_flutter_course/app/operations.dart';
import 'package:dbp_flutter_course/core/hooks/push_notification_hooks.dart';
import 'package:dbp_flutter_course/features/geolocation/actions/get_geolocation_action.dart';
import 'package:dbp_flutter_course/features/weather/actions/get_weather_by_location_action.dart';
import 'package:dbp_flutter_course/navigation/app_router.dart';
import 'package:dbp_flutter_course/presentation/dialogs/dialogs.dart';
import 'package:dbp_flutter_course/presentation/home/hooks/home_page_hooks.dart';
import 'package:dbp_flutter_course/presentation/home/widgets/weather_days_list.dart';
import 'package:dbp_flutter_course/presentation/home/widgets/weather_today.dart';
import 'package:dbp_flutter_course/presentation/search/search_page.dart';
import 'package:dbp_flutter_course/resources/images.dart';
import 'package:dbp_flutter_course/services/push_notification_service.dart';
import 'package:dbp_flutter_course/widgets/connected_loadable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends HookWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final context = useContext();
    final storeProvider = StoreProvider.of<AppState>(context, 'dispatcher');
    final dispatch = storeProvider.dispatch;
    final animation = useCurvedAnimation();

    final getGeolocationByLocation = () {
      dispatch(GetGeolocationAction())
          .then((_) => dispatch(GetWeatherByLocationAction()))
          .catchError((error) {
        showSimpleDialog(
          context: context,
          title: 'Oops!',
          text: error.toString(),
        );
      });
    };

    useEffect(() {
      if (storeProvider.state.geolocation.point == null) {
        getGeolocationByLocation();
      }
      return null;
    }, const []);

    requestNotificationPermissions();

    usePushNotificationToken();

    useFirebaseMessagingOpennedAppListener();
    useFirebaseMessagingForegroundListener();
    useFirebaseMessagingBackgroundListener();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(Images.icLocation),
          onPressed: getGeolocationByLocation,
        ),
        actions: [
          IconButton(
            onPressed: () => appRouter.goTo(
              context: context,
              route: const SearchPage(),
            ),
            icon: SvgPicture.asset(Images.icSearch),
          ),
        ],
      ),
      body: ConnectedLoadable(
        converter: (s) => [
          s.getOperationState(Operation.getGeolocation),
          s.getOperationState(Operation.getWeatherByLocation),
          s.getOperationState(Operation.getWeatherByCityName),
        ].any((element) => element.isInProgress),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Flexible(
              flex: 4,
              child: WeatherToday(animation: animation),
            ),
            const Spacer(),
            const Flexible(
              flex: 3,
              child: SafeArea(child: WeatherDaysList()),
            ),
          ],
        ),
      ),
    );
  }
}
