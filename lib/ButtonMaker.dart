import 'package:flutter/material.dart';
List<String> list = ["홈", "기획전", "랭킹", "브랜드", "IT:EM", "매거진"];

    TextButton ButtonMaker(int nameSpecifier) {
      return TextButton(
        onPressed: () {
        },
        child: Text(
          list[nameSpecifier],
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontFamily: 'Saira'),
        ),
      );
    }
