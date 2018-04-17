import 'dart:ui' show ImageFilter;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double _kTabBarHeight = 60.0;

const Color _kDefaultTabBarBackgroundColor = const Color(0xFFFFFFFF);
const Color _kDefaultTabBarBorderColor = const Color(0xFFFFFFFF);

class MCupertinoTabBar extends StatelessWidget implements PreferredSizeWidget {
  MCupertinoTabBar({
    Key key,
    @required this.items,
    this.onTap,
    this.currentIndex: 0,
    this.backgroundColor: _kDefaultTabBarBackgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.iconSize: 22.0,
  })  : assert(items != null),
        assert(items.length >= 2),
        assert(currentIndex != null),
        assert(0 <= currentIndex && currentIndex < items.length),
        assert(iconSize != null),
        super(key: key);

  /// Must not be null.
  final List<BottomNavigationBarItem> items;

  final ValueChanged<int> onTap;

  final int currentIndex;

  final Color backgroundColor;

  final Color activeColor;

  final Color inactiveColor;

  final double iconSize;

  @override
  Size get preferredSize => const Size.fromHeight(_kTabBarHeight);

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
//    Widget result = new DecoratedBox(
//      decoration: new BoxDecoration(
//        borderRadius: new BorderRadius.only(
//          topLeft: new Radius.circular(16.0),
//          topRight: new Radius.circular(16.0),
//        ),
//        color: backgroundColor,
//      ),
    // TODO(xster): allow icons-only versions of the tab bar too.
    Widget result = new SizedBox(
      height: _kTabBarHeight + bottomPadding,
      child: IconTheme.merge(
        // Default with the inactive state.
        data: new IconThemeData(
          size: iconSize,
        ),
        child: new Material(
          type: MaterialType.card,
          elevation: 20.0,
          color: backgroundColor,
          borderRadius: new BorderRadius.only(
            topLeft: new Radius.circular(16.0),
            topRight: new Radius.circular(16.0),
          ),
          child: new DefaultTextStyle(
            // Default with the inactive state.
            style: new TextStyle(
              fontFamily: '.SF UI Text',
              fontSize: 10.0,
              letterSpacing: -0.24,
              fontWeight: FontWeight.w500,
              color: inactiveColor,
            ),
            child: new Padding(
              padding: new EdgeInsets.only(bottom: bottomPadding),
              child: new Row(
                // Align bottom since we want the labels to be aligned.
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _buildTabItems(),
              ),
            ),
          ),
        ),
      ),
    );
    return result;
  }

  List<Widget> _buildTabItems() {
    final List<Widget> result = <Widget>[];

    for (int index = 0; index < items.length; index += 1) {
      if (index == 2) {
        result.add(
          _wrapActiveCenterItem(
            new Expanded(
              child: new GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onTap == null
                    ? null
                    : () {
                        onTap(index);
                      },
                child: new Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Expanded(
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
                                  color: new Color(0xFF42BE56),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(22.0)),
                                ),
                                height: 44.0,
                                width: 44.0,
                                child: items[index].icon,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            active: index == currentIndex,
          ),
        );
        continue;
      }

      result.add(
        _wrapActiveItem(
          new Expanded(
            child: new GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onTap == null
                  ? null
                  : () {
                      onTap(index);
                    },
              child: new Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Expanded(child: new Center(child: items[index].icon))
                  ],
                ),
              ),
            ),
          ),
          active: index == currentIndex,
        ),
      );
    }

    return result;
  }

  Widget _wrapActiveCenterItem(Widget item, {bool active}) {
    if (!active) {
      return IconTheme.merge(
        data: new IconThemeData(
          color: new Color(0xFFFFFFFF),
        ),
        child: item,
      );
    }

    return IconTheme.merge(
      data: new IconThemeData(color: new Color(0xFFFFFFFF)),
      child: DefaultTextStyle.merge(
        style: new TextStyle(color: activeColor),
        child: item,
      ),
    );
  }

  /// Change the active tab item's icon and title colors to active.
  Widget _wrapActiveItem(Widget item, {bool active}) {
    if (!active) {
      return IconTheme.merge(
        data: new IconThemeData(
          color: inactiveColor,
        ),
        child: item,
      );
    }

    return IconTheme.merge(
      data: new IconThemeData(color: activeColor),
      child: DefaultTextStyle.merge(
        style: new TextStyle(color: activeColor),
        child: item,
      ),
    );
  }

  /// Create a clone of the current [CupertinoTabBar] but with provided
  /// parameters overridden.
  MCupertinoTabBar copyWith({
    Key key,
    List<BottomNavigationBarItem> items,
    Color backgroundColor,
    Color activeColor,
    Color inactiveColor,
    Size iconSize,
    int currentIndex,
    ValueChanged<int> onTap,
  }) {
    return new MCupertinoTabBar(
      key: key ?? this.key,
      items: items ?? this.items,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      iconSize: iconSize ?? this.iconSize,
      currentIndex: currentIndex ?? this.currentIndex,
      onTap: onTap ?? this.onTap,
    );
  }
}
