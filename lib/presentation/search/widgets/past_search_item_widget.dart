import 'package:dbp_flutter_course/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PastSearchItemWidget extends StatelessWidget {
  const PastSearchItemWidget({
    required this.city,
    required this.onTap,
    required this.onClose,
    Key? key,
  }) : super(key: key);

  final String city;
  final VoidCallback onTap;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          city,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          width: 24,
          height: 24,
          child: IconButton(
            padding: EdgeInsets.zero,
            splashRadius: 16,
            onPressed: onClose,
            icon: SvgPicture.asset(Images.icClose),
          ),
        ),
      ],
    );
  }
}
