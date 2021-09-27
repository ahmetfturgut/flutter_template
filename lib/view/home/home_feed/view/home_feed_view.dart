import 'package:app_work/core/base/view/base_widget.dart';
import 'package:app_work/core/components/text/auto_locale_text.dart';
import 'package:app_work/core/init/lang/locale_keys.g.dart';

import 'package:app_work/view/home/home_feed/viewmodel/home_feed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kartal/kartal.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeFeedView extends StatelessWidget {
  const HomeFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeFeedViewModel>(
      viewModel: HomeFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getListAll();
      },
      onPageBuilder: (BuildContext context, HomeFeedViewModel value) =>
          Scaffold(
        body: DefaultTabController(
            length: 3,
            child: Observer(builder: (_) {
              return value.isLoaindg
                  ? buildCenter()
                  : value.houseModels == null || value.houseModels!.isEmpty
                      ? Center(child: Text('Not Found'))
                      : buildListViewRecommended(context, value);
            })),
      ),
    );
  }

  Center buildCenter() => Center(child: CircularProgressIndicator());
  Padding buildListViewRecommended(
      BuildContext context, HomeFeedViewModel value) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: ListView(
        children: [
          buildInProgressText(context),
          SizedBox(
            height: 15,
          ),
          buildInProgressListView(context, value),
          SizedBox(
            height: 12,
          ),
          buildNextUpText(context),
          SizedBox(
            height: 12,
          ),
          buildNextUpListView(context),
        ],
      ),
    );
  }

  Row buildNextUpText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoLocaleText(
          value: LocaleKeys.nextUp.tr(),
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            AutoLocaleText(
                value: LocaleKeys.viewAll.tr(),
                style: Theme.of(context).textTheme.subtitle2!),
            Icon(
              Icons.arrow_right_rounded,
            )
          ],
        ),
      ],
    );
  }

  AutoLocaleText buildInProgressText(BuildContext context) {
    return AutoLocaleText(
      value: LocaleKeys.inProgress.tr(),
      style: Theme.of(context)
          .textTheme
          .headline5!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }

  Container buildNextUpListView(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.27),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) => SizedBox(
          width: context.dynamicWidth(0.42),
          child: Padding(
            padding: context.paddingNormal,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: contex.colorScheme.onSecondary.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: Image.network(
                  'https://placeimg.com/640/480/' + index.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        itemCount: 7,
        shrinkWrap: true,
      ),
    );
  }

  InkWell buildInProgressListView(
      BuildContext context, HomeFeedViewModel value) {
    return InkWell(
      child: Row(
        children: [
          buildInProgressTabbar(context, value),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Container(
              height: context.dynamicHeight(0.4),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (contex, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: context.dynamicWidth(0.52),
                        height: context.dynamicHeight(0.33),
                        child: Padding(
                          padding: context.paddingNormal,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                  color: contex.colorScheme.onSecondary
                                      .withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7.0),
                              child: Image.network(
                                'https://placeimg.com/640/480/' +
                                    index.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )),
                    Flexible(
                      child: Padding(
                        padding: contex.horizontalPaddingNormal,
                        child: Container(
                          width: context.dynamicWidth(0.45),
                          child: AutoLocaleText(
                            value: "Near to the Wild Heart",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: contex.horizontalPaddingNormal,
                        child: Container(
                          width: context.dynamicWidth(0.45),
                          child: AutoLocaleText(
                            value: "Clarice Lispector",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: contex.horizontalPaddingNormal,
                      child: buildRatingBar(),
                    ),
                  ],
                ),
                itemCount: 7,
                shrinkWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildInProgressTabbar(
      BuildContext context, HomeFeedViewModel value) {
    return Container(
        height: context.dynamicHeight(0.45),
        child: RotatedBox(
          quarterTurns: 3,
          child: TabBar(
              indicator: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: context.colorScheme.onError, width: 3.0),
                ),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(text: LocaleKeys.home_build_tabbar_tab1.tr()),
                Tab(text: LocaleKeys.home_build_tabbar_tab2.tr()),
                Tab(text: LocaleKeys.home_build_tabbar_tab3.tr())
              ]),
        ));
  }

  RatingBar buildRatingBar() {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ignoreGestures: true,
      itemSize: 15,
      itemPadding: EdgeInsets.zero,
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
