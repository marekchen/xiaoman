import 'package:flutter/widgets.dart';

class MDivider extends StatelessWidget {
  MDivider(
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
    return BorderSide(
      color: color,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Container(
          height: 0.0,
          margin: EdgeInsetsDirectional.only(start: indent, end: endIndent),
          decoration: BoxDecoration(
            border: Border(
              bottom: createBorderSide(context, color: color),
            ),
          ),
        ),
      ),
    );
  }
}
