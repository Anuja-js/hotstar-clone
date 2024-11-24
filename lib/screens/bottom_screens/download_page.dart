import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/custom_colors.dart';
import 'package:hotstar/customs/custom_elevated_button.dart';
import 'package:hotstar/customs/text_custom.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextCustom(text: "Downloads"),
          backgroundColor: GlobelColors.bottomAppbar,
          elevation: 0,
        ),
        backgroundColor: GlobelColors.bottomAppbar,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/download.png', // Replace with your own asset image
                width: 120.w,
                height: 120.h,
              ),sh5,
              TextCustom(
               text: 'No Downloads Available',
               textSize: 16.sp,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 5.h),
                child: TextCustom(
                  text:'Explore and download your favourite movies and shows to watch on the go',
                  textAlign: TextAlign.center,overflow: TextOverflow.visible,
                 textSize: 10.sp,color: primaryColor.withOpacity(0.5),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 5.h),
                child: SizedBox(width: double.infinity,
                    child: CustomElevatedButton(label: "Go to Home", onPressed: (){},fontSize: 10.sp,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
