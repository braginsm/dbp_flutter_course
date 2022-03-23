import 'package:flutter/material.dart';

Future<void> showSimpleDialog({
  required BuildContext context,
  required String title,
  required String text,
}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
  );
}
