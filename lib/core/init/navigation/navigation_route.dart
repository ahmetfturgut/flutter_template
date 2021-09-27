import 'package:app_work/view/auth/login/view/login_view.dart';
import 'package:app_work/view/auth/register/view/register_view.dart';
import 'package:app_work/view/home/book_detail/view/book_detail.view.dart';
import 'package:app_work/view/home/home_base/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.BOOK_DATAIL:
        return normalNavigate(BookDetailView());
      case NavigationConstants.REGISTER:
        return normalNavigate(RegisterView());
      case NavigationConstants.LOGIN:
        return normalNavigate(LoginView());
      case NavigationConstants.HOME:
        return normalNavigate(Home());

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
