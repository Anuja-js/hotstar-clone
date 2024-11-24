import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hotstar/customs/custom_colors.dart';
import 'package:hotstar/customs/text_custom.dart';
import 'package:hotstar/model/MovieLIstModel.dart';
import 'package:hotstar/network/network_home.dart';
import 'package:hotstar/screens/bottom_screens/empty_search.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
   TextEditingController Searchcontroller=TextEditingController();

  @override
  void initState() {
    super.initState();
    getMovieData();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobelColors.bottomAppbar,
        appBar: AppBar(
          backgroundColor: GlobelColors.bottomAppbar,
          title: TextField(onChanged: (value){
            searchMovies(value);
            },
            cursorColor: primaryColor,controller:Searchcontroller,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r), // Rounded corners
                  borderSide: BorderSide(
                      color: primaryColor.withOpacity(0.5),
                      width: 1.w), // Default border
                ),
                isDense: true,
                // Makes the TextField compact
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
                // Adjust height

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r), // Rounded corners
                  borderSide: BorderSide(
                      color: primaryColor, width: 2.w), // Border when focused
                ),
                hintText: 'Movies, shows and more',
                fillColor: primaryColor,
                filled: true,
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: black.withOpacity(0.7),
                ),
                suffixIcon: Icon(
                  Icons.mic_none_rounded,
                  color: black.withOpacity(0.7),
                )),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                text: "Trending in",
                textSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
              sh5,
              TabBar(
                controller: tabController,
                dividerHeight: 0,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: [
                  buildTab('India', 0),
                  buildTab('Movies', 1),
                  buildTab('Shows', 2),
                  buildTab('Drama', 3),
                  buildTab('Action', 4),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    buildTrendingGrid(),
                    buildTrendingGrid(),
                    buildTrendingGrid(),
                    buildTrendingGrid(),
                    buildTrendingGrid(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTrendingGrid() {
    if(isPresent==false){return NoSearchHistory(name: Searchcontroller.text,);}else{
      return MasonryGridView.builder(
        gridDelegate:
        SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: movieList.length,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        itemBuilder: (context, index) {
          return buildTrendingItem(
              imageUrl: movieList[index].posterUrl.toString(),
              title: 'Trending Title $index',
              isFree: movieList[index].isFree!,
              isNewRelease: movieList[index].isNewRelease!,
              isNewSeason:movieList[index].seasons==null?false:true
          );
        },
      );
    }

  }

  Widget buildTrendingItem({
    required String imageUrl,
    required String title,required bool isFree,
    required bool isNewRelease,
    required bool isNewSeason,
  }) {
    double randomHeight =
        (150 + (title.hashCode % 3) * 50).toDouble(); // Variable height
    return Stack(
      children: [
        Container(
          height: randomHeight, // Set dynamic height
          child:
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: randomHeight,
                  fit: BoxFit.cover,
                ),
              ),


        ),   if(isFree)  Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.blue,
            ),
            child: TextCustom(
              text: "Free",
              color: primaryColor,
              textSize: 8.sp,
            ),
          ),
        ),
       if(isNewRelease)Positioned(
          bottom: 10,
          left: 40,
          right: 40,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Color(0xff1f4143),
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
       if(isNewSeason)Positioned(
          bottom: 10,
          left: 40,
          right: 40,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Color(0xff1f4143),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: TextCustom(
                text: "New Season",
                textSize: 6.sp,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTab(String label, int index) {
    bool isSelected = tabController.index == index;

    return InkWell(
      onTap: () {
        tabController.index = index;
        isLoading=true;

          getCategoryMovieData(label);

        isLoading=false;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? primaryColor.withOpacity(0.5)
                : GlobelColors.bottomSheetColor,
            width: isSelected ? 1.0 : 0.0, // Adjust border width
          ),
          color: isSelected
              ? GlobelColors.tabSelect
              : GlobelColors.bottomSheetColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            index == 0
                ? Image.asset(
                    "assets/images/graph.png",
                    width: 20.w,
                    height: 20.h,
                    color: isSelected
                        ? primaryColor
                        : primaryColor.withOpacity(0.5),
                  )
                : sw5,
            Text(
              label,
              style: TextStyle(
                color:
                    isSelected ? primaryColor : primaryColor.withOpacity(0.5),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
  List<Movie> movieList=[];
  List<Movie> allMovies=[];
  bool isLoading=false;
  bool isPresent=true;
  void getMovieData()async{

    movieList= await HomeNetWork().getMovieData();
    allMovies=movieList;
    setState(() {

    });}

  void getCategoryMovieData(String name)async{

    if (name == "Movies") {
      print(name);

      movieList = allMovies.where((element) => element.seasons ==null).toList();

    }
    else if (name == "Shows") {
      movieList = allMovies.where((element) => element.seasons!= null).toList();
    }else if (name == "Action") {
      movieList = allMovies.where((element) => element.genre!.contains("Action") ).toList();
    }else if (name == "Drama") {
      movieList = allMovies.where((element) => element.genre!.contains("Drama") ).toList();
    }
else{
  movieList=allMovies;
    }
    setState(() {

    });}
  void searchMovies(String search)async{
    movieList = allMovies.where((element) => element.title!.toLowerCase().contains(search.toLowerCase()) ).toList();
    if(movieList.isEmpty){
      isPresent=false;
    }else{
      isPresent=true;
    }
    setState(() {

    });
  }
}

