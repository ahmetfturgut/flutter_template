import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/home_feed_model.dart';

abstract class IHomeFeedService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  IHomeFeedService(this.manager, this.scaffoldyKey);

  Future<List<HomeFeedModel>?> fetchUserHouseList();
}
