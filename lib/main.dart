import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'CategoryMap.dart';
import 'ImageSlider.dart';
import 'ButtonMaker.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  var data = [];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int Counter=0;
  List<Container> listOfObjects = [];
  var _scrollController = ScrollController();

  void upDateListOfObjects() { //data array holds 3 and is not reset to zero. so. yeah.
     setState(() {
      for (int i=0; i< widget.data.length; i++) {
        listOfObjects.add(cardObject(Image.network(widget.data[i]['image'], fit: BoxFit.fitWidth),
            Text("Likes: " + widget.data[i]['likes'].toString()), Text("User: " + widget.data[i]['user']), Text(widget.data[i]['content'], style: TextStyle(fontWeight: FontWeight.bold),)
        ));
      }
      widget.data = [];//set to zero after ur done.
    });
  }

  @override
  void initState() {
    // TODO: implement initState
  loadInitialData();
  _scrollController.addListener(() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      LoadMoreData();
    }
    print(_scrollController.position.pixels);
  });

    super.initState();
    //init state does not support async.
  }

  loadInitialData() async {
    await getData(); //waits until ALL the data has been loaded before allowing next method to run
    //Need this so that the for loop in upDateListOfObjects doesnt run on an empty data array.
    upDateListOfObjects(); //needs to be within async method to be respected

  }

  LoadMoreData() async {

    await addNewData(Counter);

        setState(() {
          upDateListOfObjects();
          Counter++;
      });

  }

  getData() async {
    var result = await http.get(Uri.parse("https://codingapple1.github.io/app/data.json")); //wait before decoding
    var result2 = jsonDecode(result.body); //Status code  = Get request
    setState(() {
      for (int i=0; i<3; i++) {
        widget.data.add(result2[i]);
      }

    });
  }

  addNewData(int ContentCount) async { //Counter marks location of pseudo JSON file server. (for this project its just a page called BACKEND)

    //define and use function on the spot is possible. Only usable within this loop tho. And once.
    final String response = await rootBundle.loadString('Backend/somebackend.json');
    final data = await json.decode(response);
    setState(() {
      widget.data.add(data[ContentCount]);
    });
  }

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
            controller: _scrollController,
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
                      suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {}),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    )),
              ),
              FittedBox(
                child: Row(
                  children: [
                    ButtonMaker(0),
                    ButtonMaker(1),
                    ButtonMaker(2),
                    ButtonMaker(3),
                    ButtonMaker(4),
                    ButtonMaker(5)
                  ],
                ),
              ),
              ImageSlider(),
              CategoryMap(),
              Column(
                  children: listOfObjects,
              )
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
          onPressed: () async {
            await addNewData(Counter);
            upDateListOfObjects();
            Counter++;
          },
          child: Icon(Icons.arrow_upward, color: Colors.grey[700]),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }


}

Container cardObject(Image s, Text k, Text f, Text y) {
  return Container(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [s, k, f, y]),
  );
}


