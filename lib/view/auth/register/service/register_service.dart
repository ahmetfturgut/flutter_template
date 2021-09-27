import 'package:app_work/view/_product/_utilty/service_helper.dart';
import 'package:app_work/view/auth/register/model/register_model.dart';
import 'package:app_work/view/auth/register/model/register_response_model.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/enum/network_route_enum.dart';

import 'IRegisterService.dart';

class RegisterService extends IRegisterService with ServiceHelper {
  RegisterService(
      INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey)
      : super(manager, scaffoldyKey);

  @override
  Future<RegisterResponseModel?> fetchUserControl(RegisterModel model) async {
    final response =
        await manager.send<RegisterResponseModel, RegisterResponseModel>(
            NetworkRoutes.REGISTER.rawValue,
            parseModel: RegisterResponseModel(),
            method: RequestType.POST,
            data: model);
    if (response.data is RegisterResponseModel) {
      return response.data;
    } else {
      showMessage(scaffoldyKey, response.error);
    }
  }
}

// BEFORE: null safety before
// @override
// Future<RegisterResponseModel> fetchUserControl(LoginModel model) async {
//   final response = await manager.fetch<RegisterResponseModel, RegisterResponseModel>(NetworkRoutes.LOGIN.rawValue,
//       parseModel: RegisterResponseModel(), method: RequestType.POST, data: model);

//   if (response.data is RegisterResponseModel) {
//     return response.data;
//   } else {
//     return null;
//   }
// }
