import 'package:flutter/material.dart';
import 'package:happyhire_interview/provider/UserProvider.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatelessWidget {

  List<String> items = ['최신순', '순최신', '최순신'];

  String selectedValue = '최신순'; // Initial selected value

  final List<Map<String, String>> images = [
    {'image': 'assets/image1.png',},
    {'image': 'assets/image2.png', },
    {'image': 'assets/image3.png', },
  ];

  final List<Map<String, String>> reviewData = [
    {'review': '멀티 작업도 잘 되고 꽤 괜찮습니다. 저희 회사 고객님들에게도 추천 가능한 제품인 듯 합니다.', 'id':'1'},
    {'review': '3600에서 바꾸니 체감이 살짝 되네요. 버라이어티한 느낌 까지는 아닙니다.', 'id':'2'},
  ];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0), // Set the height
          child: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        leading: Padding(padding: EdgeInsets.only(top: 20), child:  IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),),
        title: Padding(padding: EdgeInsets.only(top: 20), child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "랭킹 1위",
              style: TextStyle(fontSize: 14,color: Colors.grey,  ),
            ),
            Text(
              "베스트 리뷰어",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),),
        //Text("베스트 리뷰어"),
        centerTitle: true,
      )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(userProvider.userImage),
                  ),
                  SizedBox(height: 10),
                  Text(userProvider.userName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/winner.png', fit: BoxFit.cover, width: 20),
                      SizedBox(width: 5),
                      Text("골드", style: TextStyle(color: Colors.amber, fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("조립컴 업체를 운영하며 리뷰를 작성합니다."),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(child: Row(
                          children: [
                            Text('작성한 리뷰', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            SizedBox(width: 5),
                            Text('총 35개', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),

                          ],
                        )),
                        Container(
                          height: 30,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 0.5,        // Border width
                            ),
                            borderRadius: BorderRadius.circular(20), // Optional: Rounded corners
                          ),
                          child: DropdownButton<String>(
                            value: selectedValue,
                            icon: Icon(Icons.arrow_drop_down),
                            focusColor: Colors.blue,
                            underline: Container(),
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            onChanged: (String? newValue) {

                            },
                            items: items.map<DropdownMenuItem<String>>((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),),
                  Divider(thickness: 0.5,),
                  Padding(padding: EdgeInsets.all(16),
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
                                  child: Image.asset('assets/product1.png', width: 100, height: 100),),
                              ),
                              Expanded(child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('AMD 라이젠 5 5600X 버미어정품 멀티팩', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                    Row(
                                      children: [
                                        Row(
                                          children: List.generate(5, (index) => Icon(Icons.star, color: Colors.amber, size: 25)),
                                        ),
                                        Flexible(child: Text('4.07', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),)
                                      ],
                                    ),

                                  ],
                                ),
                              )),

                            ],
                          ),

                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider( thickness: 0.5,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Row(children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage: AssetImage(userProvider.userImage),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(userProvider.userName, style: TextStyle(fontWeight: FontWeight.bold)),

                                      Row(
                                        children: [
                                          Row(
                                            children: List.generate(5, (index) => Icon(Icons.star, color: Colors.amber, size: 16)),
                                          ),
                                          SizedBox(width: 10),
                                          Text("2022.12.09", style: TextStyle(color: Colors.grey)),
                                        ],
                                      )
                                    ],
                                  )
                            ],)),
                            Icon(Icons.bookmark_border, color: Colors.grey,)
                          ],
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Text("\“가격 저렴해요\"  \“CPU온도 고온\"  \“서멀작업 가능해요\"  \“게임 잘 돌아가요\"", style: TextStyle(fontSize: 12),),
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: reviewData.map((review) {
                            return Padding(padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.symmetric(horizontal: 16,), child: Image.asset(review['id']=='1'?'assets/flash1.png':'assets/flash2.png', height: 30, width: 30, fit: BoxFit.fill,),),
                                Flexible(child: Text(review['review']!)),
                              ],
                            ),);
                          }).toList(),
                        ),

                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(left: 60),
                            height: 80,
                            child: Align(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: images.map((images) {
                                  return Padding(
                                    padding:  EdgeInsets.only(right: 5),
                                    child: Image.asset(images['image']!),
                                  );
                                }).toList(),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider( thickness: 0.5,),
                        ),
                        SizedBox(height: 20),
                      ],
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
