import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
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
    return new Container(
      decoration: new BoxDecoration(borderRadius: borderRadius, color: color),
      child: child,
      padding: new EdgeInsets.all(10.0),
    );
  }
}
