import 'package:dbp_flutter_course/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({
    required this.city,
    required this.color,
    this.fontSize = 16,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String city;
  final Color color;
  final double fontSize;
  final VoidCallback? onTap;

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
        GestureDetector(
          onTap: onTap,
          child: Text(city, style: textStyle),
        ),
      ],
    );
  }
}
