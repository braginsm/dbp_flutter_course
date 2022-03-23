import 'package:dbp_flutter_course/core/app_store_connector.dart';
import 'package:dbp_flutter_course/models/weather_day.dart';
import 'package:dbp_flutter_course/presentation/home/widgets/current_location_widget.dart';
import 'package:flutter/material.dart';

class WeatherToday extends StatelessWidget {
  const WeatherToday({
    required this.animation,
    Key? key,
  }) : super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AppStateConnector<WeatherDay>(
      converter: (s) => s.weather.today,
      builder: (context, weatherDay) => Row(
        children: [
          Expanded(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Container(
                height: 350 + animation.value,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      spreadRadius: 15,
                      blurRadius: 50,
                      offset: const Offset(0, 50),
                    ),
                  ],
                ),
                child: ClipRect(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(weatherDay.icon),
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
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
                city: weatherDay.locationName,
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
      ),
    );
  }
}
