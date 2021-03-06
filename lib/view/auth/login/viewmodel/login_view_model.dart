import 'package:app_work/core/constants/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../model/login_model.dart';
import '../service/ILoginService.dart';
import '../service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ILoginService loginService;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    loginService =
        LoginService(VexanaManager.instance.networkManager, scaffoldState);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = true;

  @action
  Future<void> fetchLoginSevice() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(LoginModel(
          email: emailController!.text, password: passwordController!.text));

      if (response != null) {
        if (scaffoldState.currentState != null) {
          navigateToHome();
        }
        await localeManager.setStringValue(
            PreferencesKeys.TOKEN, response.data!.token!);
      }
    }
    isLoadingChange();
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  Future<void> navigateToRegister() async {
    await navigation.navigateToPage(path: NavigationConstants.REGISTER);
  }

  Future<void> navigateToLogin() async {
    await navigation.navigateToPage(path: NavigationConstants.LOGIN);
  }

  Future<void> navigateToHome() async {
    await navigation.navigateToPageClear(path: NavigationConstants.HOME);
  }
}
