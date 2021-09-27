import 'package:app_work/core/base/model/base_view_model.dart';
import 'package:app_work/view/_product/_utilty/decoration_helper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
part 'book_detail_view_model.g.dart';

class BookDetailViewModel = _BookDetailViewModelBase with _$BookDetailViewModel;

abstract class _BookDetailViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  late DecorationHelper helper;

  String date = "";
  void init() {
    helper = DecorationHelper(context: context);
    date = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  }
}
