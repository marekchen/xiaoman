import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MCard extends StatelessWidget {
  MCard({
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
    return Semantics(
      container: true,
      child: Material(
        shadowColor: Color(0x78CED4DA),
        type: MaterialType.card,
        elevation: 4.0,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            child: child),
      ),
    );
  }
}
