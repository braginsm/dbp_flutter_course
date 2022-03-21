import 'package:dbp_flutter_course/models/weather_day.dart';
import 'package:flutter/material.dart';

class WeatherListItem extends StatelessWidget {
  const WeatherListItem({
    required this.weatherDay,
    this.withUnderLine = true,
    Key? key,
  }) : super(key: key);

  final WeatherDay weatherDay;
  final bool withUnderLine;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black, fontSize: 18);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                weatherDay.dayName,
                style: textStyle,
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Image.asset(
                    weatherDay.icon,
                    width: 19,
                    height: 19,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    weatherDay.weatherDescription,
                    style: textStyle.copyWith(
                      color: const Color(0xFF010E82).withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                '${weatherDay.degrees}°',
                style: textStyle,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
