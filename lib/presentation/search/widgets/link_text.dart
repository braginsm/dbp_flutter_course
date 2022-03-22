import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
