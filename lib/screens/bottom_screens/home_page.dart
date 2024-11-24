// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/card.dart';
import 'package:hotstar/customs/custom_colors.dart';
import 'package:hotstar/customs/text_custom.dart';
import 'package:hotstar/model/genre_model.dart';
import 'package:hotstar/model/match_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/language_model.dart';
import '../../model/movie_list_model.dart';
import '../../network/network_home.dart';

class HotstarHomePage extends StatefulWidget {
  const HotstarHomePage({super.key});

  @override
  State<HotstarHomePage> createState() => _HotstarHomePageState();
}

class _HotstarHomePageState extends State<HotstarHomePage> {
  List<Language> languageSelect = [];
  List<Matches> matchList = [];
  List<Genre> genreListSelect = [];
  final CarouselSliderController carouselController =
      CarouselSliderController();
  final ScrollController scontol = ScrollController();
  int currentIndex = 0;
  bool isBottomSheetVisible = false;
  @override
  void initState() {
    super.initState();
    getMovieData();
    getMatch();
    getGenre();
    getLanguages();
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

  void getLanguages() async {
    languageSelect = await HomeNetWork().getLangaugeData();
    setState(() {});
  }void getMatch() async {
    matchList = await HomeNetWork().getMatchData();
    setState(() {});
  }

  void getGenre() async {
    genreListSelect = await HomeNetWork().getGenreData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                      margin: const EdgeInsets.only(bottom: 10),
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
            child: movieList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      carasolBanner(7),
                      carasolSlider(),
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
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/ad.png",
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      latestReleases(),
                      const BrandGrid(),
                      buildContent(),
                      carasolBanner(1),
                      buildSection(
                        title: 'Top 10 in India Today',
                        language: true,
                        categories: [
                          'All',
                          'English',
                          'Hindi',
                          'Tamil',
                          'Malayalam'
                        ],
                        content: buildNumberedShows(),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 15.w),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color:
                              const Color(0xFF1A1A1A), // Dark background color
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/feedback.png",
                              width: 65.w,
                              height: 65.h,
                            ),
                            sw5,
                            // Text content
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCustom(
                                    text:
                                        'Enjoying Disney+ Hotstar? Tell us about\nyour experience now!',
                                    textSize: 11.sp,
                                    overflow: TextOverflow.visible,
                                  ),
                                  sh5,
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        TextCustom(
                                          text: 'Share feedback',
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
                        language: false,
                        categories: [
                          'All',
                          'Romance',
                          'Drama',
                          'Family',
                          'Thriller'
                        ],
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

  Widget latestReleases() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
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
            itemCount: latestList.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              return MovieCard(
                title: "Free",
                data: latestList[index],
                tag: "NEWLY ADDED",
                imageUrl: "assets/images/p4.jpg",
              );
            },
          ),
        ),
      ],
    );
  }

  Widget carasolSlider() {
    return Column(
      children: [
        CarouselSlider(
          items: movieList
              .map(
                (movie) => Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movie.posterUrl ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
          carouselController: carouselController,
          options: CarouselOptions(
            height: 250.h,
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
        SizedBox(
          height: 40.h,
          child: Column(
            children: [
              if (movieList[currentIndex].seasons != null)
                Center(
                    child: TextCustom(
                  text: "New Season",
                  color: GlobelColors.tickBlue,
                )),
              if (movieList[currentIndex].isNewRelease! &&
                  movieList[currentIndex].seasons == null)
                Center(
                    child: TextCustom(
                  text: "New Release",
                  color: GlobelColors.tickBlue,
                )),
              if (movieList[currentIndex].genre!.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(
                        text: movieList[currentIndex]
                            .genre
                            .toString()
                            .replaceAll("[", " ")
                            .replaceAll("]", " ")
                            .replaceAll(",", " ."))
                  ],
                ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 35.w),
              margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: GlobelColors.bottomSheetColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.play_arrow,
                    color: primaryColor,
                  ),
                  sw10,
                  if (movieList[currentIndex].isFree!)
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
                  if (!movieList[currentIndex].isFree!)
                    Text.rich(
                      TextSpan(
                        text: 'Subscribe ',
                        style: TextStyle(
                          color: GlobelColors.tickBlue,
                          overflow: TextOverflow.visible,
                          fontSize: 12.sp,
                        ),
                        children: [
                          TextSpan(
                            text: 'to Watch',
                            style: TextStyle(
                              color: primaryColor,
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
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
              margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: GlobelColors.bottomSheetColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: const Icon(
                Icons.add,
                color: primaryColor,
              ),
            ),
          ],
        ),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: 10,
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
      ],
    );
  }

  List<Movie> movieList = [];
  List<Movie> latestList = [];
  List<Movie> allMovies = [];
  List<Movie> languageList = [];
  List<Movie> genreList = [];
  String languageName = "All";
  String genre = "All";

  void getMovieData() async {
    movieList = await HomeNetWork().getMovieData();
    allMovies = movieList;
    languageList = movieList;
    genreList = movieList;
    latestList =
        movieList.where((Element) => Element.isNewRelease == true).toList();
    setState(() {});
  }

  void selectLanguage(String language) {
    if (language == "All") {
      languageList = movieList;
    } else {
      languageList = allMovies
          .where((Element) =>
              Element.language.toString().toLowerCase() ==
              language.toLowerCase())
          .toList();
    }
    setState(() {});
  }

  void selectgenre(String genre) {
    if (genre == "All") {
      genreList = movieList;
    } else {
      genreList =
          allMovies.where((Element) => Element.genre!.contains(genre)).toList();
    }
    setState(() {});
  }

  void getCategoryMovieData(String name) async {
    if (name == "Movies") {
      movieList =
          allMovies.where((element) => element.seasons == null).toList();
    } else if (name == "Shows") {
      movieList =
          allMovies.where((element) => element.seasons != null).toList();
    } else if (name == "Action") {
      movieList = allMovies
          .where((element) => element.genre!.contains("Action"))
          .toList();
    } else if (name == "Drama") {
      movieList = allMovies
          .where((element) => element.genre!.contains("Drama"))
          .toList();
    } else {
      movieList = allMovies;
    }
    setState(() {});
  }

  Widget buildCategorySection(
    String title,
    List<Language> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 12),
          child: TextCustom(
            text: title,
            textSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 60.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 120.w,
                height: 20.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        items[index].bannerImageUrl.toString(),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildCategorySectionTwo(
    String title,
    List<Genre> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 12),
          child: TextCustom(
            text: title,
            textSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 60.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 120.w,
                height: 20.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        items[index].bannerImageUrl.toString(),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

// Example usage:
  Widget buildContent() {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategorySection(
            'Popular Languages',
            languageSelect,
          ),
          sh20,
          buildCategorySectionTwo(
            'Popular Genres',
            genreListSelect,
          ),
        ],
      ),
    );
  }

  Widget buildSection({
    required String title,
    required List<String> categories,
    required Widget content,
    required bool language,
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
            child: language
                ? Row(
                    children: categories
                        .map((category) => InkWell(
                              onTap: () {
                                if (language) {
                                  selectLanguage(category);
                                  languageName = category;
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Chip(
                                  label: Text(
                                    category,
                                    style: TextStyle(
                                      color: category == languageName
                                          ? primaryColor
                                          : Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  backgroundColor: category == languageName
                                      ? GlobelColors.bottomSheetColor
                                      : GlobelColors.bottomAppbar,
                                ),
                              ),
                            ))
                        .toList(),
                  )
                : Row(
                    children: categories
                        .map((category) => InkWell(
                              onTap: () {
                                genre = category;
                                selectgenre(category);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Chip(
                                  label: Text(
                                    category,
                                    style: TextStyle(
                                      color: category == genre
                                          ? primaryColor
                                          : Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  backgroundColor: category == genre
                                      ? GlobelColors.bottomSheetColor
                                      : GlobelColors.bottomAppbar,
                                ),
                              ),
                            ))
                        .toList(),
                  )),
        sh10,
        content,
      ],
    );
  }

  Widget buildNumberedShows() {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 5.w),
        itemCount: languageList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: 125.w,
                height: 150.h,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    languageList[index].posterUrl.toString(),
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
              if (languageList[index].isNewRelease!)
                Positioned(
                  bottom: 10,
                  left: 40,
                  right: 40,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                      color: const Color(0xff1f4143),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: TextCustom(
                        text: "New Release",
                        textSize: 6.sp,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPopularShows() {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genreList.length,
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
                  child: Image.network(
                    genreList[index].posterUrl.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (genreList[index].isFree == true)
                Positioned(
                  left: 15,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: TextCustom(
                      text: "Free",
                      color: white,
                      textSize: 6.sp,
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (genreList[index].isNewRelease == true)
                Positioned(
                  bottom: 10,
                  left: 40,
                  right: 40,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                      color: const Color(0xff1f4143),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: TextCustom(
                        text: "New Release",
                        textSize: 6.sp,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget carasolBanner(int index) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      height: 240.h,
      decoration: BoxDecoration(
          color: GlobelColors.bottomSheetColor,
          borderRadius: BorderRadius.circular(8.r)),
      child: Stack(
        children: [
          Image.network(
            movieList[index].posterUrl.toString(),
            width: double.infinity,
            fit: BoxFit.cover,
            height: 176.h,
          ),
          Positioned(
            left: 16.w,
            bottom: 8.h,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      text: movieList[index].title.toString(),
                      textSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    TextCustom(
                      text: movieList[index].year.toString(),
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

  Widget horizontalScroll() {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        itemCount: matchList.length,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
            child: SizedBox(
              width: 200.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0.r),
                        child: Image.network(
                          matchList[index].imageUrl.toString(),
                          width: 200.w,
                          height: 90.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if(matchList[index].isLive==true)Positioned(
                          left: 10.w,
                          bottom: 10.h,
                          right: 20.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if(matchList[index].isLive==true)   const Icon(
                                Icons.play_arrow,
                                color: primaryColor,
                              ),
                              TextCustom(
                                text: matchList[index].time.toString(),
                                fontWeight: FontWeight.bold,color: matchList[index].isLive==true?Colors.red:primaryColor,
                              )
                            ],
                          )),

                      if(matchList[index].isLive==false)Positioned(

                          bottom: 10.h,
                          right: 20.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if(matchList[index].isLive==true)   const Icon(
                                Icons.play_arrow,
                                color: primaryColor,
                              ),
                              TextCustom(
                                text: matchList[index].time.toString(),
                                fontWeight: FontWeight.bold,color: matchList[index].isLive==true?Colors.red:primaryColor,
                              )
                            ],
                          ))
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: TextCustom(
                            text: matchList[index].name.toString(),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        const Icon(
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
}

class MovieCard extends StatelessWidget {
  final String title;
  final String tag;
  final Movie data;
  final String imageUrl;

  const MovieCard({
    super.key,
    required this.title,
    required this.data,
    required this.tag,
    required this.imageUrl,
  });

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
          margin: const EdgeInsets.only(right: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              data.posterUrl.toString(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (data.isFree!)
          Positioned(
            left: 15,
            top: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
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
          bottom: 10,
          left: 40,
          right: 40,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xff1f4143),
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
