import 'package:app_work/core/base/view/base_widget.dart';
import 'package:app_work/view/splash/viewmodel/splash_view_model.dart';

import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel value) => Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
