import 'dart:ui' show ImageFilter;

import 'package:flutter/widgets.dart';

double _kTabBarHeight = 50.0;

const Color _kDefaultTabBarBackgroundColor = Color(0xCCF8F8F8);
const Color _kDefaultTabBarBorderColor = Color(0x4C000000);

class MCupertinoTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a tab bar in the iOS style.
  MCupertinoTabBar({
    Key key,
    @required this.items,
    this.onTap,
    this.currentIndex = 0,
    this.backgroundColor = _kDefaultTabBarBackgroundColor,
    this.activeColor = const Color(0xFF63CA6C),
    this.inactiveColor = const Color(0xFF8E8E93),
    this.iconSize = 30.0,
  })  : assert(items != null),
        assert(items.length >= 2),
        assert(currentIndex != null),
        assert(0 <= currentIndex && currentIndex < items.length),
        assert(iconSize != null),
        super(key: key);

  /// The interactive items laid out within the bottom navigation bar.
  ///
  /// Must not be null.
  final List<BottomNavigationBarItem> items;

  /// The callback that is called when a item is tapped.
  ///
  /// The widget creating the bottom navigation bar needs to keep track of the
  /// current index and call `setState` to rebuild it with the newly provided
  /// index.
  final ValueChanged<int> onTap;

  /// The index into [items] of the current active item.
  ///
  /// Must not be null.
  final int currentIndex;

  /// The background color of the tab bar. If it contains transparency, the
  /// tab bar will automatically produce a blurring effect to the content
  /// behind it.
  final Color backgroundColor;

  /// The foreground color of the icon and title for the [BottomNavigationBarItem]
  /// of the selected tab.
  final Color activeColor;

  /// The foreground color of the icon and title for the [BottomNavigationBarItem]s
  /// in the unselected state.
  final Color inactiveColor;

  /// The size of all of the [BottomNavigationBarItem] icons.
  ///
  /// This value is used to to configure the [IconTheme] for the navigation
  /// bar. When a [BottomNavigationBarItem.icon] widget is not an [Icon] the widget
  /// should configure itself to match the icon theme's size and color.
  ///
  /// Must not be null.
  final double iconSize;

  /// True if the tab bar's background color has no transparency.
  bool get opaque => backgroundColor.alpha == 0xFF;

  @override
  Size get preferredSize => Size.fromHeight(_kTabBarHeight);

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    Widget result = DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: _kDefaultTabBarBorderColor,
            width: 0.0, // One physical pixel.
            style: BorderStyle.solid,
          ),
        ),
        color: backgroundColor,
      ),
      // TODO(xster): allow icons-only versions of the tab bar too.
      child: SizedBox(
        height: _kTabBarHeight + bottomPadding,
        child: IconTheme.merge(
          // Default with the inactive state.
          data: IconThemeData(
            color: inactiveColor,
            size: iconSize,
          ),
          child: DefaultTextStyle(
            // Default with the inactive state.
            style: TextStyle(
              fontFamily: '.SF UI Text',
              fontSize: 10.0,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w400,
              color: inactiveColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: Row(
                // Align bottom since we want the labels to be aligned.
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _buildTabItems(),
              ),
            ),
          ),
        ),
      ),
    );

    if (!opaque) {
      // For non-opaque backgrounds, apply a blur effect.
      result = ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: result,
        ),
      );
    }

    return result;
  }

  List<Widget> _buildTabItems() {
    final List<Widget> result = <Widget>[];

    for (int index = 0; index < items.length; index += 1) {
      result.add(
        _wrapActiveItem(
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap == null
                  ? null
                  : () {
                      onTap(index);
                    },
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(child: items[index].icon),
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

  /// Change the active tab item's icon and title colors to active.
  Widget _wrapActiveItem(Widget item, {bool active}) {
    if (!active) return item;

    return IconTheme.merge(
      data: IconThemeData(color: activeColor),
      child: DefaultTextStyle.merge(
        style: TextStyle(color: activeColor),
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
    return MCupertinoTabBar(
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
