import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/register_model.dart';
import '../model/register_response_model.dart';

abstract class IRegisterService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  IRegisterService(this.manager, this.scaffoldyKey);

  Future<RegisterResponseModel?> fetchUserControl(RegisterModel model);
}
