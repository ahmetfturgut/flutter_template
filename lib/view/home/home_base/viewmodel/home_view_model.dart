import 'package:app_work/core/base/model/base_view_model.dart';
import 'package:app_work/view/_product/_utilty/decoration_helper.dart';
import 'package:app_work/view/home/home_feed/view/home_feed_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
part 'home_view_model.g.dart';

class HomeModel = _HomeModelBase with _$HomeModel;

abstract class _HomeModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  late DecorationHelper helper;
  @observable
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> widgetOptions = <Widget>[
    HomeFeedView(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
  ];

  String date = "";
  void init() {
    helper = DecorationHelper(context: context);
    date = DateFormat("dd.MM.yy HH:mm", "en").format(DateTime.now());
  }

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
  }
}
