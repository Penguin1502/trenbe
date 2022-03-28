import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  int Count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text("tren",
                  style: TextStyle(
                      fontFamily: 'Gothic',
                      color: Colors.black,
                      fontWeight: FontWeight.w900)),
              Text(":",
                  style: TextStyle(
                      fontFamily: 'Gothic',
                      color: Colors.purple,
                      fontWeight: FontWeight.w900)),
              Text("be",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Gothic'))
            ],
          ),
          actions: [
            IconButton(
                splashRadius: 10,
                icon: Icon(CupertinoIcons.heart),
                onPressed: () {},
                color: Colors.black),
            IconButton(
              splashRadius: 10,
              icon: Icon(CupertinoIcons.shopping_cart),
              onPressed: () {},
              color: Colors.black,
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: '트랜비X삼성전자 최대 20% 쿠폰!',
                      contentPadding: EdgeInsets.only(left: 20, top: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "홈",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontFamily: 'Saira'),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "기획전",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontFamily: 'Saira'),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Text(
                      "랭킹",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontFamily: 'Saira'),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Text(
                      "브랜드",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontFamily: 'Saira'),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Text(
                      "IT:EM",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontFamily: 'Saira'),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Text(
                      "매거진",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontFamily: 'Saira'),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              ImageSlider(),
              CategoryMap()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.graph_square, color: Colors.grey.shade600), label: '카테고리'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.gift, color: Colors.grey.shade600), label: '이벤트'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home, color: Colors.grey.shade600), label: '홈'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag, color: Colors.grey.shade600), label: '뉴 시즌'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person, color: Colors.grey.shade600), label: '마이'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {},
          child: Icon(Icons.arrow_upward, color: Colors.grey[700]),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> imageList = [
    'images/slider1.png',
    'images/slider2.png',
    'images/slider3.png',
    'images/slider4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 200, autoPlay: true),
      items: [0,1,2,3].map((i) { //this works lets get it.
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset(imageList[i]),
            );
          },
        );
      }).toList(),
    );
  }
}

class CategoryMap extends StatelessWidget {
  const CategoryMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/women.png', height: 50),
                    Text("여성")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/men.png', height: 50),
                    Text("남성")
                  ],
                ),
              ),
              Expanded(
                child: SizedBox.square(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/kids.png', height: 50),
                      Text("키즈")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/Resale.png', height: 50),
                    Text("리세일")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/outlet.png', height: 50),
                    Text("아울렛")
                  ],
                ),
              )
          ],),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/highEnd.png', height: 50),
                        Text("하이엔드")
                      ],
                ),
                  ),
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/ContentLuxury.png', height: 50),
                    Text("컨템럭셔리")
                  ],
                ),
                ),
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/Sneakers.png', height: 50),
                    Text("스니커즈")
                  ],
                ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/HomeBling.png', height: 50),
                      Text("홈리빙")
                    ],
                  ),
                ),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/Referb.png', height: 50),
                    Text("리퍼브")
                  ],
                )),
          ]),
        ],
      )
    );
  }
}
