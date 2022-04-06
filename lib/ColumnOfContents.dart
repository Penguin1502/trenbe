import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ColumnOfContents extends StatefulWidget {
  var data = [];
  @override
  _ColumnOfContentsState createState() => _ColumnOfContentsState();
}

class _ColumnOfContentsState extends State<ColumnOfContents> {
  var scroll = ScrollController();


  getData() async {
    var result = await http.get(Uri.parse(
        "https://codingapple1.github.io/app/data.json")); //wait before decoding
    var result2 = jsonDecode(result.body); //Status code  = Get request
    setState(() {
      widget.data = result2;
    });
  }

  addNewData() async {
    //define and use function on the spot is possible. Only usable within this loop tho. And once.
    var result = await http.get(Uri.parse(
        "https://codingapple1.github.io/app/data.json")); //wait before decoding
    var result2 = jsonDecode(result.body);
    print(result2);
    setState(() {
      widget.data.add(result2[0]);
      widget.data.add(result2[1]);
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    getData();
    scroll.addListener(() {
      //listener. ah yes. gr8.
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        addNewData();
      }
      print(scroll.position.pixels);
    });

    super.initState();
    //init state does not support async.
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.data.length,
        controller: scroll,
        itemBuilder: (c, i) {
          return
          //뭘로 콘트롤하는지 말을 안하면 cant track listview's scroll position
          Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(widget.data[i]['image'], fit: BoxFit.fitWidth),
                  Text("Likes: " + widget.data[i]['likes'].toString()),
                  Text("User: " + widget.data[i]['user']),
                  Text(
                    widget.data[i]['content'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
          );
        });
  }
}
