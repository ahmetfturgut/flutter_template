import 'package:app_work/core/base/model/base_view_model.dart';
import 'package:app_work/core/constants/enums/locale_keys_enum.dart';
import 'package:app_work/core/constants/navigation/navigation_constants.dart';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;

  void init() {
    controlToApp();
  }

  Future<void> controlToApp() async {
    final token = localeManager.getStringValue(PreferencesKeys.TOKEN);
    if (token != "") {
      await Future.delayed(Duration(seconds: 1));
      navigateToHome();
    } else {
      await Future.delayed(Duration(seconds: 2));
      navigateToLogin();
    }
  }

  Future<void> navigateToRegister() async {
    await navigation.navigateToPage(path: NavigationConstants.REGISTER);
  }

  Future<void> navigateToLogin() async {
    await navigation.navigateToPage(path: NavigationConstants.LOGIN);
  }

  Future<void> navigateToHome() async {
    await navigation.navigateToPage(path: NavigationConstants.HOME);
  }
}
