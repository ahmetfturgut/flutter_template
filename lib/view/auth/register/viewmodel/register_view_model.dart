import 'package:app_work/core/constants/navigation/navigation_constants.dart';
import 'package:app_work/view/auth/register/model/register_model.dart';
import 'package:app_work/view/auth/register/service/IRegisterService.dart';
import 'package:app_work/view/auth/register/service/register_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/init/network/vexana_manager.dart';

part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late IRegisterService loginService;

  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    loginService =
        RegisterService(VexanaManager.instance.networkManager, scaffoldState);
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = true;

  @action
  Future<void> fetchRegisterSevice() async {
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(RegisterModel(
          name: nameController!.text,
          email: emailController!.text,
          password: passwordController!.text));

      if (response!.success == true) {
        if (scaffoldState.currentState != null) {
          navigateToLogin();
        }
      }
    }
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
    await navigation.navigateToPage(path: NavigationConstants.HOME);
  }
}
