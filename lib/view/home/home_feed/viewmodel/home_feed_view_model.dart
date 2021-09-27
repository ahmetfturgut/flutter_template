import 'package:app_work/view/_product/_utilty/decoration_helper.dart';
import 'package:app_work/view/home/home_feed/model/home_feed_model.dart';
import 'package:app_work/view/home/home_feed/service/IHomeFeedService.dart';
import 'package:app_work/view/home/home_feed/service/home_feed_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
part 'home_feed_view_model.g.dart';

class HomeFeedViewModel = _HomeFeedViewModelBase with _$HomeFeedViewModel;

abstract class _HomeFeedViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late DecorationHelper helper;
  late IHomeFeedService feedService;
  @observable
  List<String> likeItems = [];

  @action
  void onLikeItemPressed(String id) {
    if (likeItems.contains(id)) {
      likeItems.remove(id);
    } else {
      likeItems.add(id);
    }

    likeItems = likeItems;
  }

  @observable
  List<HomeFeedModel>? houseModels = [];

  @computed
  HomeFeedModel get sliderHouse => houseModels!.first;

  @observable
  bool isLoaindg = false;

  @override
  void init() {
    helper = DecorationHelper(context: context);
    feedService = HomeFeedService(vexanaManager!.networkManager, scaffoldKey);
  }

  @action
  void _changeLoading() {
    isLoaindg = !isLoaindg;
  }

  @action
  Future<void> getListAll() async {
    _changeLoading();
    // houseModels = await feedService.fetchUserHouseList();

    _changeLoading();
  }
}
