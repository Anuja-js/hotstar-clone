import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/logo_custom.dart';

import '../../customs/custom_colors.dart';
import '../landing_session/landing_page.dart';

class SplashScreenSecond extends StatefulWidget {
  const SplashScreenSecond({super.key});

  @override
  State<SplashScreenSecond> createState() => _SplashScreenSecondState();
}

class _SplashScreenSecondState extends State<SplashScreenSecond> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
            builder: (context) =>
                const HotstarLandingPage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [GlobelColors.darkSplash, GlobelColors.lightSplash],
          ),
        ),
        child: Center(
            child: LogoImage(
          width: 200.w,
          height: 200.h,
          color: white,
        )),
      ),
    );
  }
}
