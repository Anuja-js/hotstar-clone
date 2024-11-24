import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/logo_custom.dart';
import 'package:hotstar/customs/text_custom.dart';
import 'package:hotstar/screens/landing_session/language_selection.dart';

import '../../customs/custom_button.dart';
import '../../customs/custom_colors.dart';

class HotstarLandingPage extends StatefulWidget {
  const HotstarLandingPage({super.key});

  @override
  State<HotstarLandingPage> createState() => _HotstarLandingPageState();
}

class _HotstarLandingPageState extends State<HotstarLandingPage> {
  @override
  Widget build(BuildContext context) {
    String selectedLanguage = "English";
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/first.jpeg",
              ),
              fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 15.h),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LogoImage(
                width: 50.w,
                height: 50.h,
                color: white,
              ),
              // ShaderMask(
              //   shaderCallback: (bounds) => LinearGradient(
              //     colors: [
              //       Colors.blue.shade400,
              //       Colors.purple.shade400,
              //     ],
              //   ).createShader(bounds),
              //   child: const Text(
              //     'Endless Entertainment, Free Cricket',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 24,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),

              TextCustom(
                text:
                    'Endless Entertainment, Free Cricket on mobile, and much more',
                textSize: 15.sp,
                overflow: TextOverflow.visible,
                fontWeight: FontWeight.w500,
              ),
              sh5,
              Text.rich(
                TextSpan(
                  text:
                      'By proceeding you confirm that you are above 18 years of age and agree to the ',
                  style: TextStyle(
                    color: primaryColor.withOpacity(0.7),
                    overflow: TextOverflow.visible,
                    fontSize: 10.sp,
                  ),
                  children: [
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: primaryColor,
                        overflow: TextOverflow.visible,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.7),
                        overflow: TextOverflow.visible,
                        fontSize: 10.sp,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms of Use',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
              sh5,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 15.h,
                      child: ImageIcons(
                        image: const AssetImage("assets/images/marvel.webp"),
                      )),
                  SizedBox(
                    height: 25.h,
                    width: 40.w,
                    child: ImageIcons(
                      image: const AssetImage("assets/images/special.png"),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                    width: 40.w,
                    child: ImageIcons(
                      image: const AssetImage("assets/images/nathional.png"),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                    width: 40.w,
                    child: ImageIcons(
                      image: const AssetImage("assets/images/star.png"),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                    width: 40.w,
                    child: ImageIcons(
                      image: const AssetImage("assets/images/pixar.png"),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                    width: 40.w,
                    child: ImageIcons(
                      image: const AssetImage("assets/images/war.png"),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) {
                    return  LanguageSelectionPage();
                  }));
                },
                child: CustomButton(
icon: true,
                ),
              ),

              Center(
                child: TextButton.icon(
                  onPressed: () async {
                    await showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8.0.r),
                          ),
                        ),
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 20.w),
                            decoration: BoxDecoration(
                              color: GlobelColors.bottomSheetColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(8.0.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextCustom(
                                      text: 'App Language',
                                      fontWeight: FontWeight.bold,
                                      textSize: 15.sp,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.close_rounded,
                                          color: primaryColor.withOpacity(0.7),
                                          size: 18.sp,
                                        ))
                                  ],
                                ),
                                const Divider(),
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      selectedLanguage = "English";
                                    });
                                    Navigator.pop(context);
                                  },
                                  leading: selectedLanguage == "English"
                                      ? Icon(
                                          Icons.check,
                                          color: GlobelColors.tickBlue,
                                          size: 15.sp,
                                        )
                                      : const SizedBox(),
                                  title: TextCustom(
                                    text: "English",
                                    color: selectedLanguage == "English"
                                        ? primaryColor
                                        : primaryColor.withOpacity(0.7),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      selectedLanguage = "हिंदी";
                                    });
                                    Navigator.pop(context);
                                  },
                                  leading: selectedLanguage == "हिंदी"
                                      ? Icon(
                                          Icons.check,
                                          color: GlobelColors.tickBlue,
                                          size: 15.sp,
                                        )
                                      : const SizedBox(),
                                  title: TextCustom(
                                    text: "हिंदी",
                                    color: selectedLanguage == "हिंदी"
                                        ? primaryColor
                                        : primaryColor.withOpacity(0.7),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      selectedLanguage = "മലയാളം";
                                    });

                                    Navigator.pop(context);
                                  },
                                  leading: selectedLanguage == "മലയാളം"
                                      ? Icon(
                                          Icons.check,
                                          color: GlobelColors.tickBlue,
                                          size: 15.sp,
                                        )
                                      : const SizedBox(),
                                  title: TextCustom(
                                    text: "മലയാളം",
                                    color: selectedLanguage == "മലയാളം"
                                        ? primaryColor
                                        : primaryColor.withOpacity(0.7),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      selectedLanguage = "தமிழ்";
                                    });

                                    Navigator.pop(context);
                                  },
                                  leading: selectedLanguage == "தமிழ்"
                                      ? Icon(
                                          Icons.check,
                                          color: GlobelColors.tickBlue,
                                          size: 15.sp,
                                        )
                                      : const SizedBox(),
                                  title: TextCustom(
                                    text: "தமிழ்",
                                    color: selectedLanguage == "தமிழ்"
                                        ? primaryColor
                                        : primaryColor.withOpacity(0.7),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      selectedLanguage = "తెలుగు";
                                    });

                                    Navigator.pop(context);
                                  },
                                  leading: selectedLanguage == "తెలుగు"
                                      ? Icon(
                                          Icons.check,
                                          color: GlobelColors.tickBlue,
                                          size: 15.sp,
                                        )
                                      : const SizedBox(),
                                  title: TextCustom(
                                    text: "తెలుగు",
                                    color: selectedLanguage == "తెలుగు"
                                        ? primaryColor
                                        : primaryColor.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                    setState(() {});
                  },
                  icon: Image(
                    image: const AssetImage("assets/images/iconLanguage.png"),
                    width: 20.w,
                    height: 20.h,
                  ),
                  label: TextCustom(
                    text: 'Change App Language',
                  ),
                ),
              ),
              sh10,
            ],
          ),
        ),
      ),
    );
  }
}



// ignore: must_be_immutable
class ImageIcons extends StatelessWidget {
  ImageProvider image;

  ImageIcons({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      fit: BoxFit.contain,
    );
  }
}
