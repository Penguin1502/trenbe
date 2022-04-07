import 'package:flutter/material.dart';

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
                TextButton(
                  onPressed: (){},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/women.png', height: 50, width: 50),
                      Text("여성", style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
                TextButton(
                  onPressed: (){},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/men.png', height: 50, width: 50),
                      Text("남성", style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
                TextButton(
                  onPressed: (){},
                  child: SizedBox.square(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/kids.png', height: 50, width: 50),
                        Text("키즈", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed:(){},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/Resale.png', height: 50, width: 50),
                      Text("리세일", style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
                TextButton(
                  onPressed: (){},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/outlet.png', height: 50, width: 50),
                      Text("아울렛", style: TextStyle(color: Colors.grey))
                    ],
                  ),
                )
              ],),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/highEnd.png', height: 50, width: 50),
                        Text("하이엔드", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed:() {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/ContentLuxury.png', height: 50, width: 50),
                        Text("컨템럭셔리", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/Sneakers.png', height: 50, width: 50),
                        Text("스니커즈", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/HomeBling.png', height: 50, width: 50),
                        Text("홈리빙", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/Referb.png', height: 50, width: 50),
                          Text("리퍼브", style: TextStyle(color: Colors.grey))
                        ],
                      )),
                ]),
          ],
        )
    );
  }
}
