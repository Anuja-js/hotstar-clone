import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/custom_colors.dart';
import 'package:hotstar/customs/custom_elevated_button.dart';
import 'package:hotstar/customs/text_custom.dart';
import 'package:hotstar/model/new_and_hot.dart';

import '../../network/network_home.dart';

class NewAndHot extends StatefulWidget {
  const NewAndHot({super.key});

  @override
  State<NewAndHot> createState() => _NewAndHotState();
}

class _NewAndHotState extends State<NewAndHot> {
  List<Datum> newAndHot=[];
  @override
  void initState() {
    // TODO: implement initState
    getNewAndHot();
    super.initState();
  }
  void getNewAndHot() async {
    newAndHot = await HomeNetWork().getNewAndHotData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor:black,
        appBar: AppBar(
          backgroundColor:black,
          title: const Text(
            'New & Hot',
            style: TextStyle(color:white),
          ),
          bottom: const TabBar(
            indicatorColor: white,dividerColor: Colors.transparent,
            labelColor: white,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 3.0,
            tabs: [
              Tab(
                text: 'Free - Newly Added',
              ),
              Tab(
                text: 'Coming Soon',
              ),
              Tab(
                text: 'Shots',
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: newAndHot.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (BuildContext context, int index) {
                 return ShowCard(
                    name: newAndHot[index].title.toString(),
                    title: newAndHot[index].description.toString(),
                    subtitle: newAndHot[index].language.toString(),
                    category:  newAndHot[index].genre![1].name.toString().toString(),
                    timePosted:  newAndHot[index].duration.toString(),
                    imageUrl:
               newAndHot[index].posterUrl.toString(), free:  newAndHot[index].isFree==true,
                  );
              },
            ),

            const Center(
              child: Text(
                'Coming Soon Content',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Tab 3 Content
            const Center(
              child: Text(
                'Shots Content',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowCard extends StatelessWidget {
  final String title;
  final String name;
  final String subtitle;
  final String category;
  final String timePosted;
  final String imageUrl;
final bool free;
  const ShowCard({
    super.key,
    required this.title,
    required this.name,
    required this.subtitle,
    required this.category,
    required this.timePosted,
    required this.imageUrl,required this.free,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Show Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              imageUrl,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Show Info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    imageUrl,
                    width: 45.w,
                    height: 45.h,
                    fit: BoxFit.cover,
                  ),
                ),
         sw10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                        text:  name,overflow: TextOverflow.visible,color: primaryColor.withOpacity(0.5),
                        textSize: 10.sp,
                      ),
                      TextCustom(
                       text:  title,maxLines: 2,
                       textSize: 10.sp,
                      ),
                     sh5,
                      Row(
                        children: [
                          TextCustom(
                          text:   timePosted,
                         color: primaryColor.withOpacity(0.5),
                          ),
                         sw5,
                           TextCustom(
                           text:  "•",color: primaryColor.withOpacity(0.5),

                          ),
                         sw5,
                          TextCustom(
                            text:   subtitle,
                            color: blue,
                          ),sw5,
                          TextCustom(
                            text:  "•",color: primaryColor.withOpacity(0.5),

                          ),
                          sw5,
                          TextCustom(
                            text:   category,
                            color: primaryColor.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Watch Button
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(label:free? "Watch Show":"Subscribe to Watch",textColor: black,backgroundColor: primaryColor,
                    borderRadius: 5.r,
                    icon: const Icon(Icons.play_arrow,color: black,),fontSize: 12.sp,
                    onPressed: (){}),
              ),sw10,
            if(free==true)  SizedBox(width: 40.w,height: 40.h,child: CustomElevatedButton(label: "+", onPressed: (){},textColor: primaryColor,
                  backgroundColor:  const Color(0xff222327)),)

            ],
          ),
       ],
      ),
    );
  }
}

// Example usage in a screen
