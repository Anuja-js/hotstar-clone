import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/custom_button.dart';
import 'package:hotstar/customs/custom_colors.dart';
import 'package:hotstar/customs/text_custom.dart';
import 'package:hotstar/model/language_model.dart';
import 'package:hotstar/network/network_home.dart';
import 'package:hotstar/screens/bottom_screens/bottom_appbar_page.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
   List<Language> languages = [
  ];

  final Set<String> selectedLanguages = {};
  @override
  void initState() {
   getLanguages();
    super.initState();
  }
  void getLanguages()async{
    languages=await HomeNetWork().getLangaugeData();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: languages.isEmpty?Center(child: CircularProgressIndicator(),):Stack(
            children: [
              SingleChildScrollView(
                child: ConstrainedBox(constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height,
                    maxWidth: MediaQuery.of(context).size.width),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sh10,
                      Center(
                        child: TextCustom(
                          text: 'Build Your Home Page',
                          textSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sh5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.volume_up, color: primaryColor, size: 15.sp),
                          sw5,
                          TextCustom(
                            text: 'Choose your favourite languages',
                            textSize: 12,
                            color: primaryColor.withOpacity(0.4),
                          ),
                        ],
                      ),
                      sh20,
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.8,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: languages.length,
                          itemBuilder: (context, index) {
                            final language = languages[index];
                            final isSelected =
                                selectedLanguages.contains(language.name);

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    selectedLanguages.remove(language.name);
                                  } else {
                                    selectedLanguages.add(language.name.toString());
                                  }
                                });
                              },
                              child: LanguageCard(
                                language: language,
                                isSelected: isSelected,
                              ),
                            );
                          },
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text:
                          'We will use your information to personalize and improve your Disney+ Hotstar experience and to send you information about the service. By clicking "Start Watching" you agree to our Terms of Use',
                          style: TextStyle(
                            color: primaryColor.withOpacity(0.4),
                            overflow: TextOverflow.visible,
                            fontSize: 9.sp,
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms of Use ',
                              style: TextStyle(
                                color: primaryColor,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.bold,
                                fontSize: 9.sp,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),

                            TextSpan(
                              text: ' and acknowledge that you have read our ',
                              style: TextStyle(
                                color: primaryColor.withOpacity(0.4),
                                overflow: TextOverflow.visible,
                                fontSize: 9.sp,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.visible,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                              text: '. Disney+ Hotstar will collect your location data and data relating to the other apps installed to offer personalized video suggestions and ads.',
                              style: TextStyle(
                                fontSize: 9.sp,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                      ),
                      sh50,
                      sh20
                    ],
                  ),

                ),
              ),
              Positioned(right: 16,left: 16,bottom: 20,
                child:  Visibility(
                visible: selectedLanguages.isNotEmpty,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){return MainScreen();}
                    ));
                    print("Selected Languages: $selectedLanguages");
                  },
                  child: CustomButton(icon: false),
                ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageCard extends StatelessWidget {
  final Language language;
  final bool isSelected;

  const LanguageCard({
    Key? key,
    required this.language,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: primaryColor.withOpacity(isSelected ? 0.8 : 0.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            language.bannerImageUrl.toString(),
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
          ),
          // Positioned(
          //   left: 12.w,
          //   bottom: 12.h,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       TextCustom(
          //         text: language.,
          //         fontWeight: FontWeight.bold,
          //         textSize: 10.sp,
          //       ),
          //       TextCustom(
          //         text: language.name.toString(),
          //         color: primaryColor.withOpacity(0.7),
          //         textSize: 9.sp,
          //       ),
          //     ],
          //   ),
          // ),
          if (isSelected)
            Positioned(
              top: 4.h,
              left: 4.w,
              child: Icon(
                Icons.favorite,
                color:red,
                size: 20.sp,
              ),
            ),
        ],
      ),
    );
  }
}

class LanguageOption {
  final String name;
  final String nativeName;
  final String imageUrl;

  LanguageOption({
    required this.name,
    required this.nativeName,
    required this.imageUrl,
  });
}
