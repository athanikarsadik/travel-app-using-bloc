import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  final String text;
  double size;
  final Color color;

  AppText(
      {super.key,
      required this.text,
      this.color = Colors.black54,
      this.size = 16});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size,),
    );
  }
}
