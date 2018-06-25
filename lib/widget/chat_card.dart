import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatCard extends StatelessWidget {
  ChatCard({
    Key key,
    this.color,
    @required this.child,
    @required this.borderRadius,
  }) : super(key: key);

  final Widget child;

  final Color color;

  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: borderRadius, color: color),
      child: child,
      padding: EdgeInsets.all(10.0),
    );
  }
}
