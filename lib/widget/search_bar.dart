import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../base/mcard.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;

  SearchBar({Key key, @required this.controller}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return MCard(
      color: Color(0xFFF3F4F6),
      radius: 8.0,
      child: Container(
        padding: EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: '搜索',
            hintStyle: TextStyle(
              color: Color(0xFF768196),
              fontSize: 14.0,
            ),
            icon: Icon(
              Icons.search,
              color: Color(0xFF9DA4B3),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
