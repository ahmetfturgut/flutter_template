import 'package:app_work/core/base/view/base_widget.dart';
import 'package:app_work/core/components/text/auto_locale_text.dart';

import 'package:app_work/view/home/book_detail/viewmodel/book_detail_view_model.dart';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BookDetailView extends StatelessWidget {
  const BookDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BookDetailViewModel>(
      viewModel: BookDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, BookDetailViewModel value) =>
          DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: context.paddingLow,
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: [
                        SizedBox(
                          width: context.dynamicWidth(0.5),
                          height: context.dynamicHeight(0.8),
                          child: Padding(
                            padding: context.paddingNormal,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.network(
                                'https://placeimg.com/640/480/any',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            AutoLocaleText(
                              value: "Eleanor Oliphant",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: context.colorScheme.onSecondary,
                                      fontWeight: FontWeight.bold),
                            ),
                            AutoLocaleText(
                              value: "Gail Honeyman",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: context.colorScheme.onSecondary,
                                      fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: context.colorScheme.onError
                                        .withOpacity(0.5),
                                    spreadRadius: 4,
                                    blurRadius: 1,
                                    // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.lock_clock),
                                  AutoLocaleText(
                                    value: "In Progress",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color:
                                                context.colorScheme.onSecondary,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(color: context.colorScheme.onSecondary),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          AutoLocaleText(
                            value: "Description",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: context.colorScheme.onSecondary,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Flexible(
                              child: Container(
                                child: Text(
                                  "em Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type spe the 1500s, when an unknown printer took a galley of type and scrambled it to make a type spe the 1500s, when an unknown printer took a galley of type and scrambled it to make a type spe the 1500s, when an unknown printer took a galley of type and scrambled it to make a type spe the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset s",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: context.colorScheme.onSecondary),
                  Expanded(
                    flex: 3,
                    child: Container(
                        child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: context.dynamicWidth(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AutoLocaleText(
                                value: "Tür",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: context.colorScheme.onBackground,
                                        fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.favorite),
                              AutoLocaleText(
                                value: "Romantik",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: context.colorScheme.onBackground,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(color: context.colorScheme.onSecondary),
                        Container(
                          width: context.dynamicWidth(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AutoLocaleText(
                                value: "Beğeni",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color: context.colorScheme.onBackground,
                                        fontWeight: FontWeight.bold),
                              ),
                              AutoLocaleText(
                                value: "54",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color: context.colorScheme.onSecondary,
                                        fontWeight: FontWeight.bold),
                              ),
                              AutoLocaleText(
                                value: "Kişi",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: context.colorScheme.onBackground,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(color: context.colorScheme.onSecondary),
                        Container(
                          width: context.dynamicWidth(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AutoLocaleText(
                                value: "Uzunluk",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: context.colorScheme.onBackground,
                                        fontWeight: FontWeight.bold),
                              ),
                              AutoLocaleText(
                                value: "547",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: context.colorScheme.onSecondary,
                                        fontWeight: FontWeight.bold),
                              ),
                              AutoLocaleText(
                                value: "Sayfa",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: context.colorScheme.onBackground,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(color: context.colorScheme.onSecondary),
                        Container(
                          width: context.dynamicWidth(0.3),
                          child: Column(
                            children: [
                              AutoLocaleText(
                                value: "Tar",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: context.colorScheme.onSecondary,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                  Divider(color: context.colorScheme.onSecondary),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          AutoLocaleText(
                            value: "Highlights",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: context.colorScheme.onSecondary,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Flexible(
                              child: Container(
                                child: AutoLocaleText(
                                  value:
                                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color:
                                              context.colorScheme.onBackground,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
