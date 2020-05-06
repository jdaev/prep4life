import 'package:flutter/material.dart';
import 'package:prep4life/constants/keys.dart';
import 'package:prep4life/constants/strings.dart';

enum TabItem { feed, dash, account }

class TabItemData {
  const TabItemData(
      {@required this.key, @required this.title, @required this.icon});

  final String key;
  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.feed: TabItemData(
      key: Keys.feedTab,
      title: Strings.courses,
      icon: Icons.work,
    ),
    TabItem.dash: TabItemData(
      key: Keys.dashTab,
      title: Strings.dash,
      icon: Icons.view_headline,
    ),
    TabItem.account: TabItemData(
      key: Keys.accountTab,
      title: Strings.account,
      icon: Icons.person,
    ),
  };
}
