
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/text_custom.dart';

import 'custom_colors.dart';
class CustomButton extends StatelessWidget {
  String? text;
  bool? icon;

  CustomButton({this.text,this.icon

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            GlobelColors.buttonLight,
            GlobelColors.buttonDark,
          ],
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.center, // Centers content initially
        children: [
          TextCustom(
            text: text??'Continue',
            fontWeight: FontWeight.bold,
          ),
          sw5,
          icon==true? Icon(
            Icons.arrow_forward_ios,
            size: 12.sp,
            color: white, // Matches text color
          ):SizedBox(),
        ],
      ),
    );
  }
}