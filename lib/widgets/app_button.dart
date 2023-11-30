import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final Color color;
  final Color bgColor;
  String? text;
  IconData? icon;
  bool? isIcon;
  final double size;
  final Color borderColor;
  AppButton(
      {super.key,
      required this.color,
      this.text,
      this.isIcon = false,
      this.icon,
      required this.bgColor,
      required this.borderColor,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
        border: Border.all(color: color, width: 1.0),
      ),
      child: !isIcon!
          ? Center(
            child: AppText(
                text: text!,
                color: color,
              ),
          )
          : Center(
            child: Icon(
                icon,
                color: color,
              ),
          ),
    );
  }
}
