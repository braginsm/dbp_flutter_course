import 'package:dbp_flutter_course/resources/images.dart';
import 'package:dbp_flutter_course/resources/strings.dart';
import 'package:dbp_flutter_course/theme/weather_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    required this.controller,
    required this.focusNode,
    required this.onTap,
    required this.onCloseTap,
    required this.onEditingComplete,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onTap;
  final VoidCallback onCloseTap;
  final Function(String) onEditingComplete;

  @override
  Widget build(BuildContext context) {
    final textStyle = defaultTextStyle.copyWith(
      fontSize: 16,
      height: 1.5,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );

    return TextFormField(
      style: textStyle,
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      onEditingComplete: () => onEditingComplete(controller.text),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            Images.icSearch,
            color: focusNode.hasFocus ? Colors.indigo.shade900 : Colors.grey,
          ),
        ),
        suffixIcon: focusNode.hasFocus
            ? IconButton(
                icon: SvgPicture.asset(Images.icClose),
                onPressed: onCloseTap,
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        filled: true,
        hintStyle: textStyle.copyWith(
          color: const Color(0xFF111111).withOpacity(0.5),
        ),
        hintText: Strings.enterCityName,
        fillColor: Colors.white70,
      ),
    );
  }
}
