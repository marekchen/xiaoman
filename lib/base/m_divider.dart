import 'package:flutter/widgets.dart';

class MDivider extends StatelessWidget {
  const MDivider(
      {Key key,
      this.height = 16.0,
      this.indent = 0.0,
      this.endIndent = 0.0,
      this.color})
      : assert(height >= 0.0),
        super(key: key);

  final double height;

  final double indent;

  final double endIndent;

  final Color color;

  static BorderSide createBorderSide(BuildContext context,
      {Color color, double width = 0.0}) {
    assert(width != null);
    return new BorderSide(
      color: color,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: height,
      child: new Center(
        child: new Container(
          height: 0.0,
          margin: new EdgeInsetsDirectional.only(start: indent, end: endIndent),
          decoration: new BoxDecoration(
            border: new Border(
              bottom: createBorderSide(context, color: color),
            ),
          ),
        ),
      ),
    );
  }
}
