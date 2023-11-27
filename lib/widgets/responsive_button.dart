import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  double? width;
  bool? isResponsive;
  ResponsiveButton({super.key, this.width, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset("img/button-one.png")],
      ),
    );
  }
}
