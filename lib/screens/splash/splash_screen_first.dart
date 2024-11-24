import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/custom_colors.dart';
import 'package:hotstar/main.dart';
import 'package:hotstar/screens/splash/splash_screen_second.dart';
class SplashScreenFirst extends StatefulWidget {
  const SplashScreenFirst({Key? key}) : super(key: key);

  @override
  State<SplashScreenFirst> createState() => _SplashScreenFirstState();
}

class _SplashScreenFirstState extends State<SplashScreenFirst> {
  @override
  void initState() {
  Future.delayed(Duration(seconds: 2),(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreenSecond()), // Replace `NextScreen` with your target screen.
    );
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: GlobelColors.splashFirst ,

    );
  }
}
