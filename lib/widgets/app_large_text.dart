import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppLargeText extends StatelessWidget {
  final String text;
  double size;
  final Color color;

  AppLargeText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.size = 30});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
