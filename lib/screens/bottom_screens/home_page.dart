import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/custom_colors.dart';
import 'package:hotstar/customs/custom_elevated_button.dart';
import 'package:hotstar/customs/text_custom.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HotstarHomePage extends StatefulWidget {
  @override
  State<HotstarHomePage> createState() => _HotstarHomePageState();
}

class _HotstarHomePageState extends State<HotstarHomePage> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  final ScrollController scontol = ScrollController();
  int currentIndex = 0;
  bool isBottomSheetVisible = false;
  @override
  void initState() {
    super.initState();
    // Add scroll listener
    scontol.addListener(() {
      final bool shouldShowBottomSheet = scontol.offset > 0.1;
      if (shouldShowBottomSheet != isBottomSheetVisible) {
        setState(() {
          isBottomSheetVisible = shouldShowBottomSheet;
        });
      }
    });
  }

  @override
  void dispose() {
    scontol.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/p1.jpg',
      'assets/images/p2.jpeg',
      'assets/images/p3.jpeg',
      'assets/images/p4.jpg',
      'assets/images/p1.jpg',
      'assets/images/p2.jpeg',
      'assets/images/p3.jpeg',
      'assets/images/p4.jpg',
    ];
    return SafeArea(
      child: Theme(
        data: ThemeData(
            bottomSheetTheme: const BottomSheetThemeData(
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent)),
        child: Scaffold(
          bottomSheet: isBottomSheetVisible
              ? BottomSheet(
                  backgroundColor: Colors.transparent,
                  dragHandleColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  onClosing: () {},
                  builder: (ctx) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 16.w),
                      margin: EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: GlobelColors.bottomSheetColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextCustom(
                            text: "Tv | Movies | Sports | More",
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.visible,
                          )
                        ],
                      ),
                    );
                  })
              : sh5,
          backgroundColor: black,
          body: SingleChildScrollView(
            controller: scontol,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselBanner(),
                CarouselSlider(
                  items: images
                      .map(
                        (imageUrl) => Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    height: 200.h,
                    enlargeFactor: 1,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    viewportFraction: 2,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Center(
                    child: TextCustom(
                  text: "New Season",
                  color: GlobelColors.tickBlue,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(
                        text: "Tamil .Reality . Competition . Casual Viewing")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 35.w),
                      margin: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: GlobelColors.bottomSheetColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: primaryColor,
                          ),
                          sw10,
                          Text.rich(
                            TextSpan(
                              text: 'Watch',
                              style: TextStyle(
                                color: primaryColor,
                                overflow: TextOverflow.visible,
                                fontSize: 12.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Free',
                                  style: TextStyle(
                                    color: GlobelColors.tickBlue,
                                    overflow: TextOverflow.visible,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 18.w),
                      margin: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: GlobelColors.bottomSheetColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.add,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: images.length,
                    effect: ScrollingDotsEffect(
                      dotWidth: 5.0,
                      dotHeight: 5.0,
                      activeDotColor: primaryColor,
                      dotColor: GlobelColors.greybox,
                    ),
                    onDotClicked: (index) {
                      carouselController
                          .animateToPage(index); // Change slide on dot click
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: TextCustom(
                    text: "Best In Sports",
                    textSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                horizontalScroll(),
                Container(
                  height: 70.h,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                      color: GlobelColors.bottomSheetColor,
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/ad.png",
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
                LatestReleasesSection(),
                buildSection(
                  title: 'Top 10 in India Today',
                  categories: [
                    'All',
                    'Hindi',
                    'English',
                    'Tamil',
                    'Telugu',
                    'Malayalam'
                  ],
                  content: buildNumberedShows(),
                ),
            Container(margin: EdgeInsets.symmetric(vertical: 8.h,horizontal: 15.w),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),  // Dark background color
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                 Image.asset("assets/images/feedback.png",width: 65.w,height: 65.h,),
                  sw5,
                  // Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         TextCustom(
                         text: 'Enjoying Disney+ Hotstar? Tell us about\nyour experience now!',
                       textSize: 11.sp,overflow: TextOverflow.visible,
                        ),
                       sh5,
                        GestureDetector(
                          onTap: (){},
                          child: Row(
                            children: [
                              TextCustom(
                              text : 'Share feedback',
                               textSize: 10.sp,
                                color: blue,
                              ),
                             sw5,
                              Icon(
                                Icons.arrow_forward,
                                color: blue[400],
                                size: 16.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
                buildSection(
                  title: 'Popular Shows',
                  categories: ['All', 'Romance', 'Drama', 'Family', 'Reality'],
                  content: _buildPopularShows(),
                ),
                sh50,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSection({
    required String title,
    required List<String> categories,
    required Widget content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextCustom(
            text: title,
            fontWeight: FontWeight.bold,
            textSize: 15.sp,
            overflow: TextOverflow.visible,
          ),
        ),
        sh10,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: categories
                .map((category) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Chip(
                        label: Text(
                          category,
                          style: TextStyle(
                            color: category == 'All'
                                ? primaryColor
                                : Colors.white.withOpacity(0.5),
                          ),
                        ),
                        backgroundColor: category == 'All'
                            ? GlobelColors.bottomSheetColor
                            : GlobelColors.bottomAppbar,
                      ),
                    ))
                .toList(),
          ),
        ),
      sh10,
        content,
      ],
    );
  }

  Widget buildNumberedShows() {
    final shows = [
      {'title': 'Sarfira', 'image': 'assets/sarfira.jpg'},
      {'title': 'Heart Beat', 'image': 'assets/heartbeat.jpg'},
      {'title': 'Dead Pool', 'image': 'assets/deadpool.jpg'},
    ];

    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 5.w),
        itemCount: shows.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: 125.w,
                height: 150.h,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/p4.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: -5,
                bottom: -25,
                child: TextCustom(
                  text: '${index + 1}',
                  textSize: 50.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPopularShows() {
    final shows = [
      {'title': 'Romance Show 1', 'isFree': true},
      {'title': 'Big Boss', 'isFree': true},
      {'title': 'Drama Show 1', 'isFree': true},
    ];

    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: shows.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: 140.w,
                height: 150.h,
                margin: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/p2.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (shows[index]['isFree'] == true)
                Positioned(
                  left: 15,
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: TextCustom(
                      text: "Free",color: white,
                      textSize: 6.sp,
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class CarouselBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      height: 250.h,
      decoration: BoxDecoration(
          color: GlobelColors.bottomSheetColor,
          borderRadius: BorderRadius.circular(8.r)),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/poster.jpeg",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 16.w,
            bottom: 20.h,
            right: 16,
            child: Row(
              children: [
                SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: Image.asset(
                    "assets/images/logoBlue.png",
                    fit: BoxFit.cover,
                  ),
                ),
                sw5,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      text: "Parachute",
                      textSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    TextCustom(
                      text: "Streaming from Nov 29",
                      color: primaryColor.withOpacity(0.6),
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 25.h,
              right: 16,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: GlobelColors.greybox,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: TextCustom(
                    text: "Teaser",
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class LatestReleasesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: TextCustom(
            text: "Latest Releases",
            fontWeight: FontWeight.bold,
            textSize: 16.sp,
            overflow: TextOverflow.visible,
          ),
        ),
        Container(
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 10,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              return MovieCard(
                title: "Free",
                tag: "NEWLY ADDED",
                imageUrl: "assets/images/p4.jpg",
              );
            },
          ),
        ),
      ],
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String tag;
  final String imageUrl;

  const MovieCard({
    Key? key,
    required this.title,
    required this.tag,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.only(right: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 15,
          top: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: TextCustom(
              text: title,
              textSize: 6.sp,
              overflow: TextOverflow.visible,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          right: 15,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Color(0xff1f4143),
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextCustom(
              text: tag,
              textSize: 6.sp,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      ],
    );
  }
}

Widget horizontalScroll() {
  return SizedBox(
    height: 160.h,
    child: ListView.builder(
      itemCount: 9,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
          child: Container(
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0.r),
                      child: Image.asset(
                        'assets/images/p1.jpg',
                        width: 200.w,
                        height: 90.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        left: 10.w,
                        bottom: 10.h,
                        right: 20.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: primaryColor,
                            ),
                            TextCustom(
                              text: "Live",
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextCustom(
                          text: 'Telugu Titans vs Haryana Steelers',
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      Icon(
                        Icons.more_vert_outlined,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
