import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'm_cupertino_tabbar.dart';

class MCupertinoTabScaffold extends StatefulWidget {
  const MCupertinoTabScaffold({
    Key key,
    @required this.tabBar,
    @required this.tabBuilder,
  })  : assert(tabBar != null),
        assert(tabBuilder != null),
        super(key: key);

  /// Must not be null.
  final MCupertinoTabBar tabBar;

  final IndexedWidgetBuilder tabBuilder;

  @override
  _CupertinoTabScaffoldState createState() => new _CupertinoTabScaffoldState();
}

class _CupertinoTabScaffoldState extends State<MCupertinoTabScaffold> {
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.tabBar.currentIndex;
  }

  @override
  void didUpdateWidget(MCupertinoTabScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tabBar.currentIndex != oldWidget.tabBar.currentIndex) {
      _currentPage = widget.tabBar.currentIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> stacked = <Widget>[];

    Widget content = new _TabSwitchingView(
      currentTabIndex: _currentPage,
      tabNumber: widget.tabBar.items.length,
      tabBuilder: widget.tabBuilder,
    );

    if (widget.tabBar != null) {
      final MediaQueryData existingMediaQuery = MediaQuery.of(context);

      // TODO(xster): Use real size after partial layout instead of preferred size.
      // https://github.com/flutter/flutter/issues/12912
      final double bottomPadding = widget.tabBar.preferredSize.height +
          existingMediaQuery.padding.bottom;

      content = new MediaQuery(
        data: existingMediaQuery.copyWith(
          padding: existingMediaQuery.padding.copyWith(
            bottom: bottomPadding,
          ),
        ),
        child: content,
      );
    }

    stacked.add(content);

    if (widget.tabBar != null) {
      stacked.add(
        new Align(
          alignment: Alignment.bottomCenter,
          child: widget.tabBar.copyWith(
            currentIndex: _currentPage,
            onTap: (int newIndex) {
              setState(() {
                _currentPage = newIndex;
              });
              if (widget.tabBar.onTap != null) widget.tabBar.onTap(newIndex);
            }
          ),
        ),
      );
    }

    return new Stack(
      children: stacked,
    );
  }
}

class _TabSwitchingView extends StatefulWidget {
  const _TabSwitchingView({
    @required this.currentTabIndex,
    @required this.tabNumber,
    @required this.tabBuilder,
  })  : assert(currentTabIndex != null),
        assert(tabNumber != null && tabNumber > 0),
        assert(tabBuilder != null);

  final int currentTabIndex;
  final int tabNumber;
  final IndexedWidgetBuilder tabBuilder;

  @override
  _TabSwitchingViewState createState() => new _TabSwitchingViewState();
}

class _TabSwitchingViewState extends State<_TabSwitchingView> {
  List<Widget> tabs;
  List<FocusScopeNode> tabFocusNodes;

  @override
  void initState() {
    super.initState();
    tabs = new List<Widget>(widget.tabNumber);
    tabFocusNodes = new List<FocusScopeNode>.generate(
      widget.tabNumber,
      (int index) => new FocusScopeNode(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _focusActiveTab();
  }

  @override
  void didUpdateWidget(_TabSwitchingView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _focusActiveTab();
  }

  void _focusActiveTab() {
    FocusScope.of(context).setFirstFocus(tabFocusNodes[widget.currentTabIndex]);
  }

  @override
  void dispose() {
    for (FocusScopeNode focusScopeNode in tabFocusNodes) {
      focusScopeNode.detach();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: new List<Widget>.generate(widget.tabNumber, (int index) {
        final bool active = index == widget.currentTabIndex;

        if (active || tabs[index] != null) {
          tabs[index] = widget.tabBuilder(context, index);
        }

        return new Offstage(
          offstage: !active,
          child: new TickerMode(
            enabled: active,
            child: new FocusScope(
              node: tabFocusNodes[index],
              child: tabs[index] ?? new Container(),
            ),
          ),
        );
      }),
    );
  }
}
