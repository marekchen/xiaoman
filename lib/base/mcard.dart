import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MCard extends StatelessWidget {
  const MCard({
    Key key,
    this.color,
    this.child,
    this.radius: 10.0,
  }) : super(key: key);

  final Widget child;

  final Color color;

  final double radius;

  @override
  Widget build(BuildContext context) {
    return new Semantics(
      container: true,
      child: new Material(
        shadowColor: const Color(0x78CED4DA),
        type: MaterialType.card,
        elevation: 4.0,
        borderRadius: new BorderRadius.all(new Radius.circular(radius)),
        child: new Container(
            decoration: new BoxDecoration(
              color: color,
              borderRadius: new BorderRadius.all(new Radius.circular(radius)),
            ),
            child: child),
      ),
    );
  }
}
