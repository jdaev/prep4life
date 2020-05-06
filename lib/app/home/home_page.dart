
import 'package:flutter/material.dart';
import 'package:prep4life/app/home/account/account_page.dart';
import 'package:prep4life/app/home/cupertino_home_scaffold.dart';
import 'package:prep4life/app/home/dash/dash_page.dart';
import 'package:prep4life/app/home/feed/feed_page.dart';
import 'package:prep4life/app/home/tab_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.feed;

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.feed: GlobalKey<NavigatorState>(),
    TabItem.dash: GlobalKey<NavigatorState>(),
    TabItem.account: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.feed: (_) => FeedPage(),
      TabItem.dash: (_) => DashPage(),
      TabItem.account: (_) => AccountPage(),
    };
  }

  void _select(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: CupertinoHomeScaffold(
        currentTab: _currentTab,
        onSelectTab: _select,
        widgetBuilders: widgetBuilders,
        navigatorKeys: navigatorKeys,
      ),
    );
  }

}
