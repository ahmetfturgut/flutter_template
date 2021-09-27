// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeFeedViewModel on _HomeFeedViewModelBase, Store {
  Computed<HomeFeedModel>? _$sliderHouseComputed;

  @override
  HomeFeedModel get sliderHouse => (_$sliderHouseComputed ??=
          Computed<HomeFeedModel>(() => super.sliderHouse,
              name: '_HomeFeedViewModelBase.sliderHouse'))
      .value;

  final _$likeItemsAtom = Atom(name: '_HomeFeedViewModelBase.likeItems');

  @override
  List<String> get likeItems {
    _$likeItemsAtom.reportRead();
    return super.likeItems;
  }

  @override
  set likeItems(List<String> value) {
    _$likeItemsAtom.reportWrite(value, super.likeItems, () {
      super.likeItems = value;
    });
  }

  final _$houseModelsAtom = Atom(name: '_HomeFeedViewModelBase.houseModels');

  @override
  List<HomeFeedModel>? get houseModels {
    _$houseModelsAtom.reportRead();
    return super.houseModels;
  }

  @override
  set houseModels(List<HomeFeedModel>? value) {
    _$houseModelsAtom.reportWrite(value, super.houseModels, () {
      super.houseModels = value;
    });
  }

  final _$isLoaindgAtom = Atom(name: '_HomeFeedViewModelBase.isLoaindg');

  @override
  bool get isLoaindg {
    _$isLoaindgAtom.reportRead();
    return super.isLoaindg;
  }

  @override
  set isLoaindg(bool value) {
    _$isLoaindgAtom.reportWrite(value, super.isLoaindg, () {
      super.isLoaindg = value;
    });
  }

  final _$getListAllAsyncAction =
      AsyncAction('_HomeFeedViewModelBase.getListAll');

  @override
  Future<void> getListAll() {
    return _$getListAllAsyncAction.run(() => super.getListAll());
  }

  final _$_HomeFeedViewModelBaseActionController =
      ActionController(name: '_HomeFeedViewModelBase');

  @override
  void onLikeItemPressed(String id) {
    final _$actionInfo = _$_HomeFeedViewModelBaseActionController.startAction(
        name: '_HomeFeedViewModelBase.onLikeItemPressed');
    try {
      return super.onLikeItemPressed(id);
    } finally {
      _$_HomeFeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoading() {
    final _$actionInfo = _$_HomeFeedViewModelBaseActionController.startAction(
        name: '_HomeFeedViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_HomeFeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
likeItems: ${likeItems},
houseModels: ${houseModels},
isLoaindg: ${isLoaindg},
sliderHouse: ${sliderHouse}
    ''';
  }
}
