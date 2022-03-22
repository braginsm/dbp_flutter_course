import 'package:dbp_flutter_course/models/city_item.dart';
import 'package:flutter/material.dart';

class CitiesListItemWidget extends StatelessWidget {
  const CitiesListItemWidget({
    required this.city,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final CityItem city;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Row(
          children: [
            Text(
              city.city,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 2,
              backgroundColor: Color(0xFFC4C4C4),
            ),
            const SizedBox(width: 8),
            Text(
              city.country,
              style: const TextStyle(
                color: Color(0xFF888888),
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
