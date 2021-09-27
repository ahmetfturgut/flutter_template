import 'package:app_work/view/_product/_utilty/service_helper.dart';
import 'package:app_work/view/_product/enum/network_route_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/home_feed_model.dart';
import 'IHomeFeedService.dart';

class HomeFeedService extends IHomeFeedService with ServiceHelper {
  HomeFeedService(INetworkManager manager, GlobalKey<ScaffoldState> key)
      : super(manager, key);

  @override
  Future<List<HomeFeedModel>?> fetchUserHouseList() async {
    final response = await manager.send<HomeFeedModel, HomeFeedModel>("books",
        parseModel: HomeFeedModel(), method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
  }
}

// BEFORE: null safety
//  @override
//   Future<List<HouseModel>> fetchUserHouseList() async {
//     final response =
//         await manager.fetch<HouseModel, List<HouseModel>>(NetworkRoutes.BUILD_HOME.rawValue, parseModel: HouseModel(), method: RequestType.GET);
//     showMessage(scaffoldyKey, response.error);
//     return response.data;
//   }
