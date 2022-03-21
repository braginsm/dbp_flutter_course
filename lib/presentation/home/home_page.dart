import 'package:dbp_flutter_course/models/weather_day.dart';
import 'package:dbp_flutter_course/presentation/home/widgets/weather_days_list.dart';
import 'package:dbp_flutter_course/presentation/home/widgets/weather_today.dart';
import 'package:dbp_flutter_course/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weatherDays = [
    WeatherDay(
      locationName: 'Cupertino',
      degrees: '10',
      weatherDescription: '',
      icon: Images.ic01d,
      dayName: 'Monday',
    ),
    WeatherDay(
      locationName: 'Cupertino',
      degrees: '15',
      weatherDescription: '',
      icon: Images.ic01d,
      dayName: 'Tuesday',
    ),
    WeatherDay(
      locationName: 'Cupertino',
      degrees: '14',
      weatherDescription: '',
      icon: Images.ic01d,
      dayName: 'Wednesday',
    ),
    WeatherDay(
      locationName: 'Cupertino',
      degrees: '14',
      weatherDescription: '40%',
      icon: Images.ic01d,
      dayName: 'Thursday',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(Images.icLocation),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Images.icSearch),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          WeatherToday(
            weatherDay: WeatherDay(
              locationName: 'Cupertino',
              degrees: '12',
              weatherDescription: 'Sunny and bright',
              icon: Images.ic01d,
              dayName: '',
            ),
          ),
          SafeArea(child: WeatherDaysList(weatherDays: weatherDays)),
        ],
      ),
    );
  }
}
