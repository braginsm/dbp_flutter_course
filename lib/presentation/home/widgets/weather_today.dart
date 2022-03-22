import 'package:dbp_flutter_course/models/weather_day.dart';
import 'package:dbp_flutter_course/presentation/home/widgets/current_location_widget.dart';
import 'package:flutter/material.dart';

class WeatherToday extends StatelessWidget {
  const WeatherToday({
    required this.weatherDay,
    Key? key,
  }) : super(key: key);

  final WeatherDay weatherDay;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(weatherDay.icon),
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerRight,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentLocationWidget(
              color: const Color(0xFF070501).withOpacity(0.6),
              weatherDay: weatherDay,
            ),
            Text(
              '${weatherDay.degrees}°',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              weatherDay.weatherDescription,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(width: 36),
      ],
    );
  }
}
