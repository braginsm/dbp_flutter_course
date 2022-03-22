import 'package:dbp_flutter_course/models/weather_day.dart';
import 'package:dbp_flutter_course/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({
    required this.weatherDay,
    required this.color,
    this.fontSize = 16,
    Key? key,
  }) : super(key: key);

  final WeatherDay weatherDay;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w300,
    );

    return Row(
      children: [
        Opacity(
          opacity: 0.5,
          child: SvgPicture.asset(Images.icGeoMark, color: color),
        ),
        SizedBox(width: fontSize / 4),
        Text(weatherDay.locationName, style: textStyle),
      ],
    );
  }
}
