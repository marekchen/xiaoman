import 'package:flutter/widgets.dart';

class MCard extends StatelessWidget {
  const MCard({
    Key key,
    this.color,
    this.child,
    this.radius: 16.0,
  }) : super(key: key);

  final Widget child;

  final Color color;

  final double radius;

  @override
  Widget build(BuildContext context) {
    return new Semantics(
      container: true,
      child: new Container(
        decoration: new BoxDecoration(
          color: color,
          borderRadius: new BorderRadius.all(new Radius.circular(radius)),
        ),
        child: child,
      ),
    );
  }
}
