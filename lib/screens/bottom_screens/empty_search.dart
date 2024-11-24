import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../customs/custom_colors.dart';
import '../../customs/text_custom.dart';
class NoSearchHistory extends StatelessWidget {
  String name;
   NoSearchHistory({Key? key,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      Column(
        mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/lamp.png', // Replace with your own asset image
            width: 150.w,
            height: 160.h,
          ),sh5,
          TextCustom(
            text: """Couldn't find "${name}" """,
            textSize: 16.sp,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 5.h),
            child: TextCustom(
              text:'Try searching for something else or try with a different spelling',
              textAlign: TextAlign.center,overflow: TextOverflow.visible,
              textSize: 12.sp,color: primaryColor.withOpacity(0.5),
            ),
          ),

        ],
      );

  }
}
