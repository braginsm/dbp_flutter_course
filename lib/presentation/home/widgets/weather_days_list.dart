import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dbp_flutter_course/core/app_store_connector.dart';
import 'package:dbp_flutter_course/models/weather_day.dart';
import 'package:dbp_flutter_course/presentation/home/widgets/weather_list_item.dart';
import 'package:flutter/material.dart';

class WeatherDaysList extends StatelessWidget {
  const WeatherDaysList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppStateConnector<BuiltList<WeatherDay>>(
      converter: (s) => s.weather.nextDays,
      builder: (context, nextDays) => Container(
        height: MediaQuery.of(context).size.height / 4,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(92, 131, 150, 0.05),
              blurRadius: 12,
              offset: Offset(0, -8), // changes position of shadow
            ),
          ],
        ),
        child: ListView.separated(
          itemCount: nextDays.length,
          itemBuilder: (_, index) {
            final item = nextDays[index];

            return WeatherListItem(weatherDay: item);
          },
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
    );
  }
}
