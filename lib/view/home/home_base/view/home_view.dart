import 'package:app_work/core/base/view/base_widget.dart';
import 'package:app_work/core/components/text/auto_locale_text.dart';
import 'package:app_work/core/extension/context_extension.dart';
import 'package:app_work/view/home/home_base/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      viewModel: HomeModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeModel value) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: AutoLocaleText(
            value: "Hello Ahmet",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
        body: Observer(builder: (_) {
          return Center(
            child: value.widgetOptions.elementAt(value.selectedIndex),
          );
        }),
        bottomNavigationBar: Observer(builder: (_) {
          return SizedBox(
            height: 78,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: context.colors.onSecondary,
                ),
                child: BottomNavigationBar(
                  selectedItemColor: Colors.amber[800],
                  unselectedItemColor: Colors.white,
                  backgroundColor: Colors.red,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.library_add_check_sharp),
                      label: 'Business',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border),
                      label: 'School',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profil',
                    ),
                  ],
                  currentIndex: value.selectedIndex,
                  onTap: value.onItemTapped,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
