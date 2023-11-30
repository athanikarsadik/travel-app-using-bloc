import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  double? width;
  bool? isResponsive;
  ResponsiveButton({super.key, this.width=120, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.only(left: 20,right: 10),
        width: isResponsive!?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment:isResponsive!?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            isResponsive!?AppText(text: "Book Trip Now",color: Colors.white,):Container(),
            Image.asset("img/button-one.png")],
        ),
      ),
    );
  }
}
