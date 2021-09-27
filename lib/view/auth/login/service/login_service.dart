import 'package:app_work/view/_product/_utilty/service_helper.dart';
import 'package:app_work/view/auth/login/model/login_model.dart';
import 'package:app_work/view/auth/login/model/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/enum/network_route_enum.dart';

import 'ILoginService.dart';

class LoginService extends ILoginService with ServiceHelper {
  LoginService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey)
      : super(manager, scaffoldyKey);

  @override
  Future<LoginResponseModel?> fetchUserControl(LoginModel model) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(
        NetworkRoutes.LOGIN.rawValue,
        parseModel: LoginResponseModel(),
        method: RequestType.POST,
        data: model);
    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      showMessage(scaffoldyKey, response.error);
    }
  }
}

// BEFORE: null safety before
// @override
// Future<LoginResponseModel> fetchUserControl(LoginModel model) async {
//   final response = await manager.fetch<LoginResponseModel, LoginResponseModel>(NetworkRoutes.LOGIN.rawValue,
//       parseModel: LoginResponseModel(), method: RequestType.POST, data: model);

//   if (response.data is LoginResponseModel) {
//     return response.data;
//   } else {
//     return null;
//   }
// }
