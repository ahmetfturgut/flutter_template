import 'package:app_work/core/base/view/base_widget.dart';
import 'package:app_work/core/components/text/auto_locale_text.dart';
import 'package:app_work/core/constants/image/image_constatns.dart';
import 'package:app_work/core/init/lang/locale_keys.g.dart';
import 'package:app_work/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
          Scaffold(
        key: viewModel.scaffoldState,
        backgroundColor: Colors.white,
        body: Padding(
          padding: context.paddingMedium,
          child: Form(
            key: viewModel.formState,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildImage(context),
                buildWelcomeText(context),
                Container(
                  height: context.dynamicHeight(0.2),
                  child: Column(
                    children: [
                      buildEmailTextForm(viewModel),
                      SizedBox(
                        height: 3,
                      ),
                      buildPasswordTextForm(viewModel),
                      buildForgotPasswordTextButton(context)
                    ],
                  ),
                ),
                Container(
                  height: context.dynamicHeight(0.22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildSingInButtonText(context, viewModel),
                          buildSingUpButtonText(context, viewModel)
                        ],
                      ),
                      buildLoginButton(context, viewModel)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return ClipOval(
        child: Material(
          color: viewModel.isLoading
              ? context.colorScheme.onBackground
              : context.colorScheme.onError,
          child: InkWell(
            onTap: viewModel.isLoading
                ? null
                : () {
                    viewModel.fetchLoginSevice();
                  },
            child: SizedBox(
                width: 56,
                height: 56,
                child: Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                )),
          ),
        ),
      );
    });
  }

  TextButton buildSingUpButtonText(
      BuildContext context, LoginViewModel viewModel) {
    return TextButton(
        onPressed: viewModel.navigateToRegister,
        child: AutoLocaleText(
          value: LocaleKeys.singUp.tr(),
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold, color: context.colorScheme.onError),
        ));
  }

  TextButton buildSingInButtonText(
      BuildContext context, LoginViewModel viewModel) {
    return TextButton(
        onPressed: viewModel.navigateToLogin,
        child: AutoLocaleText(
          value: LocaleKeys.singIn.tr(),
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold, color: context.colorScheme.onError),
        ));
  }

  Expanded buildForgotPasswordTextButton(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {},
              child: AutoLocaleText(
                value: LocaleKeys.forgotPassword.tr(),
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onError),
              ))
        ],
      ),
    );
  }

  Widget buildPasswordTextForm(LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
          controller: viewModel.passwordController,
          obscureText: viewModel.isLockOpen,
          decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: LocaleKeys.password.tr(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              contentPadding: EdgeInsets.only(top: 15),
              suffixIcon: InkWell(onTap: () {
                viewModel.isLockStateChange();
              }, child: Observer(builder: (_) {
                return Icon(
                    viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
              }))));
    });
  }

  TextFormField buildEmailTextForm(LoginViewModel viewModel) {
    return TextFormField(
        controller: viewModel.emailController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: LocaleKeys.email.tr(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ));
  }

  Container buildWelcomeText(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.08),
      child: AutoLocaleText(
        value: LocaleKeys.welcomeBack.tr(),
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Container buildImage(BuildContext context) {
    return Container(
      height: context.mediaQuery.viewInsets.bottom > 0
          ? 0
          : context.dynamicHeight(0.4),
      child:
          Image(image: AssetImage(ImageConstants.instance.toJpg("login_book"))),
    );
  }
}
