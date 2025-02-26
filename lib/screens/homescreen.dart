import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhire_interview/extras/globalFunctions.dart';
import 'package:happyhire_interview/provider/UserProvider.dart';
import 'package:happyhire_interview/screens/profilescreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  final List<String> bannerImages = [
    'assets/banner1.jpeg',
    'assets/banner2.png',
    'assets/banner3.png',
    'assets/banner4.jpeg',
  ];

  final List<Map<String, String>> topReviews = [
    {'title': 'LG전자 스탠바이미 27ART10AKPL (스탠', 'subtitle': '화면을 이동할 수 있고 전환도 편리하다는 점이 제일 마음에 들었어요. 배송도 빠르고 친절하게 받을 수 있어서 좋았습니다.', 'subtitle2': '스탠바이미는 사랑입니다!️', 'image': 'assets/monitor.png', 'rank': 'assets/crown1.png', 'rating':'4.89' , 'rating_count':'216' },
    {'title': 'LG전자  울트라HD 75UP8300KNA (스탠드)', 'subtitle': '화면 잘 나오고... 리모컨 기능 좋습니다.', 'subtitle2': '넷플 아마존 등 버튼하나로 바로 접속 되',  'image': 'assets/tv.png', 'rank': 'assets/crown2.png', 'rating':'4.36', 'rating_count':'136' },
    {'title': '라익미 스마트 DS4001L NETRANGE (스탠드)GX30K WIN10 (SSD 256GB)', 'subtitle': '반응속도 및 화질이나 여러면에서도 부족함', 'subtitle2': '중소기업TV 라익미 제품을 사용해보았는',  'image': 'assets/tablet.jpeg', 'rank': 'assets/crown3.png', 'rating':'3.98', 'rating_count':'98' },
  ];

  final List<Map<String, String>> topReviewers = [
    {'name': 'Name01', 'image': 'assets/cat1.png', 'id':'1'},
    {'name': 'Name02', 'image': 'assets/cat2.png', 'id':'2'},
    {'name': 'Name03', 'image': 'assets/cat3.png', 'id':'3'},
    {'name': 'Name04', 'image': 'assets/cat4.png', 'id':'4'},
    {'name': 'Name05', 'image': 'assets/cat5.png', 'id':'5'},
    {'name': 'Name06', 'image': 'assets/cat6.png', 'id':'6'},
    {'name': 'Name07', 'image': 'assets/cat7.png', 'id':'7'},
    {'name': 'Name08', 'image': 'assets/cat8.png', 'id':'8'},
    {'name': 'Name09', 'image': 'assets/cat9.png', 'id':'9'},
    {'name': 'Name10', 'image': 'assets/cat10.png', 'id':'10'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [ Colors.blue,Colors.purple,],
                  ),
                ),
                padding: EdgeInsets.all(2), // Space for border thickness
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white, // Background color inside the gradient border
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: InputBorder.none,
                      hintText: "검색어를 입력하세요",
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(Icons.search)
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1.0,
                    aspectRatio: 16 / 9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: bannerImages.map((image) {
                    return ClipRRect(
                      child: Image.asset(image, fit: BoxFit.cover, width: 1000),
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 0,  // Aligns the widget at the bottom
                  left: 0,
                  right: 0,  // Makes it stretch horizontally
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bannerImages.map((url) {
                      int index = bannerImages.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index ? Colors.blue : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),)
              ],
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text('제일 핫한 리뷰를 만나보세요', style: TextStyle(fontSize: 12)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('리뷰 랭킹 Top 3', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),),
                        Icon(Icons.chevron_right, size: 30,)

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: topReviews.map((review) {
                        return Padding(padding: EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 105, height: 105,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey, // Border color
                                          width: 0.5,        // Border width
                                        ),
                                        borderRadius: BorderRadius.circular(5), // Optional: Rounded corners
                                      ),
                                      child: Padding(padding: EdgeInsets.all(15),
                                        child: Image.asset(review['image']!, width: 100, height: 100),),
                                    ),
                                    Expanded(child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(review['title']!, style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,),
                                          Row(
                                            children: [
                                              Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(Icons.brightness_1, size: 5,),),
                                              Flexible(child: Text(review['subtitle']!, overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,),)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(Icons.brightness_1, size: 5,),),
                                              Flexible(child: Text(review['subtitle2']!, overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,),)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(padding: EdgeInsets.symmetric(horizontal: 0), child: Icon(Icons.star, size: 15, color: Colors.yellow,),),
                                              Text(review['rating']!, overflow: TextOverflow.ellipsis,
                                                maxLines: 1, style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
                                                softWrap: false,),
                                              Text(' (${review['rating_count']!})', overflow: TextOverflow.ellipsis,
                                                maxLines: 1, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                                                softWrap: false,)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(3),
                                                color: Colors.black12,
                                                child: Text('라익미', style: TextStyle(fontSize: 8),),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left:3),
                                                padding: EdgeInsets.all(3),
                                                color: Colors.black12,
                                                child: Text('라익미', style: TextStyle(fontSize: 8),),
                                              )
                                            ],
                                          )

                                        ],
                                      ),
                                    )),

                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(left: 5, top: 5), child:  Image.asset(review['rank']!),),

                              ],
                            )
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(bottom: 30),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text('골드 계급 사용자들이예요', style: TextStyle(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('베스트 리뷰어 Top 10', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: topReviewers.map((reviewer) {
                        return GestureDetector(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Stack(
                                children: [
                                  reviewer['id']! == '1'? Image.asset('assets/winner.png', fit: BoxFit.cover, width: 10):Container(),
                                  Column(
                                    children: [
                                      Container(
                                        width: 50, // Adjust size as needed
                                        height: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: reviewer['id']! == '1'? Colors.yellow:Colors.white, // Border color
                                            width: 4.0, // Border width
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(reviewer['image']!), // Your image
                                          radius: 45,
                                        ),
                                      ),
                                      Text(reviewer['name']!),
                                    ],
                                  ),
                                ],
                              )
                          ),
                          onTap: (){
                            Provider.of<UserProvider>(context, listen: false).setUser(reviewer['name']!, reviewer['image']!);
                            openPage(context, ProfileScreen());
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}