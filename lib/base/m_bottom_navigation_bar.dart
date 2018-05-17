import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

const double _kTopMargin = 8.0;
const double _kBottomMargin = 8.0;
const double _kTabBarHeight = 50.0;

class MBottomNavigationBar extends StatefulWidget
    implements PreferredSizeWidget {
  MBottomNavigationBar({
    Key key,
    @required this.items,
    this.onTap,
    this.currentIndex: 0,
    this.fixedColor,
    this.defaultColor,
    this.iconSize: 24.0,
  })  : assert(items != null),
        assert(items.length >= 2),
        assert(0 <= currentIndex && currentIndex < items.length),
        assert(iconSize != null),
        super(key: key);

  final List<BottomNavigationBarItem> items;

  final ValueChanged<int> onTap;

  final int currentIndex;

  final Color fixedColor;

  final Color defaultColor;

  final double iconSize;

  @override
  _BottomNavigationBarState createState() => new _BottomNavigationBarState();

  // TODO: implement preferredSize
  @override
  Size get preferredSize => const Size.fromHeight(_kTabBarHeight);
}

class _BottomNavigationBarState extends State<MBottomNavigationBar>
    with TickerProviderStateMixin {
  List<AnimationController> _controllers;
  List<CurvedAnimation> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = new List<AnimationController>.generate(widget.items.length,
        (int index) {
      return new AnimationController(
        duration: kThemeAnimationDuration,
        vsync: this,
      )..addListener(_rebuild);
    });
    _animations =
        new List<CurvedAnimation>.generate(widget.items.length, (int index) {
      return new CurvedAnimation(
          parent: _controllers[index],
          curve: Curves.fastOutSlowIn,
          reverseCurve: Curves.fastOutSlowIn.flipped);
    });
    _controllers[widget.currentIndex].value = 1.0;
  }

  void _rebuild() {
    setState(() {
      // Rebuilding when any of the controllers tick, i.e. when the items are
      // animated.
    });
  }

  @override
  void didUpdateWidget(MBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != oldWidget.currentIndex) {
      _controllers[oldWidget.currentIndex].reverse();
      _controllers[widget.currentIndex].forward();
    }
  }

  List<Widget> _createTiles() {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    assert(localizations != null);
    final List<Widget> children = <Widget>[];
    Color themeColor;
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    switch (themeData.brightness) {
      case Brightness.light:
        themeColor = themeData.primaryColor;
        break;
      case Brightness.dark:
        themeColor = themeData.accentColor;
        break;
    }
    final ColorTween colorTween = new ColorTween(
      begin: widget.defaultColor ?? textTheme.caption.color,
      end: widget.fixedColor ?? themeColor,
    );
    for (int i = 0; i < widget.items.length; i += 1) {
      if (i == 2) {
        children.add(
          new _BottomNavigationTileCenter(
            widget.items[i],
            _animations[i],
            widget.iconSize,
            onTap: () {
              if (widget.onTap != null) widget.onTap(i);
            },
            colorTween: colorTween,
            selected: i == widget.currentIndex,
            indexLabel: localizations.tabLabel(
                tabIndex: i + 1, tabCount: widget.items.length),
          ),
        );
        continue;
      }
      children.add(
        new _BottomNavigationTile(
          widget.items[i],
          _animations[i],
          widget.iconSize,
          onTap: () {
            if (widget.onTap != null) widget.onTap(i);
          },
          colorTween: colorTween,
          selected: i == widget.currentIndex,
          indexLabel: localizations.tabLabel(
              tabIndex: i + 1, tabCount: widget.items.length),
        ),
      );
    }
    return children;
  }

  Widget _createContainer(List<Widget> tiles) {
    return DefaultTextStyle.merge(
      overflow: TextOverflow.ellipsis,
      child: new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tiles,
        ),
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double additionalBottomPadding = 0.0;
    return new Stack(
      children: <Widget>[
        new Positioned.fill(
          child: new Material(
            // Casts shadow.
            elevation: 8.0,
            color: Colors.white,
          ),
        ),
        new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: kBottomNavigationBarHeight + additionalBottomPadding,
          ),
          child: _createContainer(_createTiles()),
        ),
      ],
    );
  }
}

class _BottomNavigationTileCenter extends StatelessWidget {
  const _BottomNavigationTileCenter(
    this.item,
    this.animation,
    this.iconSize, {
    this.onTap,
    this.colorTween,
    this.flex,
    this.selected: false,
    this.indexLabel,
  }) : assert(selected != null);

  final BottomNavigationBarItem item;
  final Animation<double> animation;
  final double iconSize;
  final VoidCallback onTap;
  final ColorTween colorTween;
  final double flex;
  final bool selected;
  final String indexLabel;

  Widget _buildIcon() {
    Color iconColor;
    iconColor = colorTween.evaluate(animation);
    return new Align(
      alignment: Alignment.topCenter,
      heightFactor: 1.0,
      child: new Container(
        margin: new EdgeInsets.only(top: _kTopMargin),
        child: new IconTheme(
          data: new IconThemeData(
            color: Colors.white,
            size: iconSize,
          ),
          child: item.icon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: new Semantics(
        container: true,
        selected: selected,
        child: new Stack(
          children: <Widget>[
            new InkResponse(
              onTap: onTap,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Align(
                    alignment: Alignment.topCenter,
                    heightFactor: 1.0,
                    child: new Container(
                      decoration: new BoxDecoration(
                        color: colorTween.end,
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(22.0)),
                      ),
                      height: 44.0,
                      width: 44.0,
                      child: _buildIcon(),
                    ),
                  ),
                ],
              ),
            ),
            new Semantics(
              label: indexLabel,
            )
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationTile extends StatelessWidget {
  const _BottomNavigationTile(
    this.item,
    this.animation,
    this.iconSize, {
    this.onTap,
    this.colorTween,
    this.flex,
    this.selected: false,
    this.indexLabel,
  }) : assert(selected != null);

  final BottomNavigationBarItem item;
  final Animation<double> animation;
  final double iconSize;
  final VoidCallback onTap;
  final ColorTween colorTween;
  final double flex;
  final bool selected;
  final String indexLabel;

  Widget _buildIcon() {
    Color iconColor;
    iconColor = colorTween.evaluate(animation);
    return new Align(
      alignment: Alignment.topCenter,
      heightFactor: 1.0,
      child: new Container(
        child: new IconTheme(
          data: new IconThemeData(
            color: iconColor,
            size: iconSize,
          ),
          child: item.icon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: new Semantics(
        container: true,
        selected: selected,
        child: new Stack(
          children: <Widget>[
            new InkResponse(
              onTap: onTap,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildIcon(),
                ],
              ),
            ),
            new Semantics(
              label: indexLabel,
            )
          ],
        ),
      ),
    );
  }
}
