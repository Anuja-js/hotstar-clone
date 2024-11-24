import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/custom_colors.dart';
import 'package:hotstar/customs/text_custom.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobelColors.bottomAppbar,
      appBar: AppBar(bottom: PreferredSize(preferredSize: Size(MediaQuery.of(context).size.width,1), child:   Divider(thickness: 0.5,),),
        backgroundColor: GlobelColors.bottomAppbar,elevation: 0,
        title: TextCustom(
          text: 'Help & Settings',
          textSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSettingsItem(sub: "Downloads quality, Strorage and More",
              title: 'Downloads',leading: Icon(Icons.download_outlined,color: primaryColor,size: 20.sp,),
              onTap: () {
              },
              trailing: Icon(Icons.keyboard_arrow_down_sharp,color: primaryColor,size: 18.sp,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Divider(thickness: 0.5,),
            ),
            buildSettingsItem(sub: "English",
              title: 'App Language',leading: Image.asset("assets/images/iconLanguage.png",width: 20.w,height: 20.h,),
              onTap: () {
              },
              trailing:Icon(Icons.arrow_forward_ios,color: primaryColor,size: 12.sp,),
            ), Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Divider(thickness: 0.5,),
            ),
            buildSettingsItem(
              title: 'Help & Support',sub: "Help Center",leading: Icon(Icons.help_outline_sharp,color: primaryColor,size: 20,),
              onTap: () {
              },
              trailing: Icon(Icons.arrow_forward_ios,color: primaryColor,size: 12.sp,),
            ),
            sh50,
            sh50,
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(text: 'Privacy Policy . Subscriber Agreement',overflow: TextOverflow.visible,color: primaryColor.withOpacity(0.5),textSize: 8.sp,),
                  sh5,
                  TextCustom(text: 'App Version 24.10.21.8',color: primaryColor.withOpacity(0.5),textSize: 8.sp,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsItem({
    required String title,
    required String sub,
    required VoidCallback onTap,
    Widget? trailing,
    Widget? leading,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (leading != null) leading,
            sw10,
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12.sp,color: primaryColor),
                ),
                TextCustom(text: sub,color: primaryColor.withOpacity(0.5),textSize: 10,),

              ],
            ),Spacer(),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }
}
