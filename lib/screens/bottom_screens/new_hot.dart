import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/custom_button.dart';
import 'package:hotstar/customs/custom_colors.dart';
import 'package:hotstar/customs/custom_elevated_button.dart';
import 'package:hotstar/customs/text_custom.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({Key? key}) : super(key: key);

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
        body: const TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ShowCard(
                    name: "Anupama",
                    title: 'Dance your troubles away like Anupama',
                    subtitle: '10 Saal Baad',
                    category: 'Drama',
                    timePosted: '2m',
                    imageUrl:
                        "assets/images/p3.jpeg",
                  ),
                  ShowCard(
                    name: "Anupama",
                    title: 'Dance your troubles away like Anupama',
                    subtitle: '10 Saal Baad',
                    category: 'Drama',
                    timePosted: '2m',
                    imageUrl:
                    "assets/images/p3.jpeg",
                  ), ShowCard(
                    name: "Anupama",
                    title: 'Dance your troubles away like Anupama',
                    subtitle: '10 Saal Baad',
                    category: 'Drama',
                    timePosted: '2m',
                    imageUrl:
                    "assets/images/p3.jpeg",
                  ),


                ],
              ),
            ),
            // Tab 2 Content
            Center(
              child: Text(
                'Coming Soon Content',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Tab 3 Content
            Center(
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

  const ShowCard({
    Key? key,
    required this.title,
    required this.name,
    required this.subtitle,
    required this.category,
    required this.timePosted,
    required this.imageUrl,
  }) : super(key: key);

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
            child: Image.asset(
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
                  child: Image.asset(
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
                       text:  title,overflow: TextOverflow.visible,
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
              SizedBox(width: MediaQuery.of(context).size.width/1.3,
                child: CustomElevatedButton(label: "Watch Show",textColor: black,backgroundColor: primaryColor,
                    borderRadius: 5.r,
                    icon: Icon(Icons.play_arrow,color: black,),fontSize: 12.sp,
                    onPressed: (){}),
              ),sw10,
              SizedBox(width: 40.w,height: 40.h,child: CustomElevatedButton(label: "+", onPressed: (){},textColor: primaryColor,
                  backgroundColor:  Color(0xff222327)),)

            ],
          ),
       ],
      ),
    );
  }
}

// Example usage in a screen
