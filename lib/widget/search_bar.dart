import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:xiaoman/base/mcard.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;

  SearchBar({Key key,@required this.controller}) : super(key: key);

  @override
  _SearchBarState createState() => new _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return new MCard(
      color: new Color(0xFFF3F4F6),
      radius: 8.0,
      child: new Container(
        padding: new EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
        child: new TextField(
          controller: widget.controller,
          decoration: new InputDecoration(
            hintText: '搜索',
            hintStyle: new TextStyle(
              color: new Color(0xFF768196),
              fontSize: 14.0,
            ),
            icon: new Icon(
              Icons.search,
              color: new Color(0xFF9DA4B3),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}