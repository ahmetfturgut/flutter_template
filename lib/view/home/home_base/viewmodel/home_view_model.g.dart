// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeModel on _HomeModelBase, Store {
  final _$selectedIndexAtom = Atom(name: '_HomeModelBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$_HomeModelBaseActionController =
      ActionController(name: '_HomeModelBase');

  @override
  void onItemTapped(int index) {
    final _$actionInfo = _$_HomeModelBaseActionController.startAction(
        name: '_HomeModelBase.onItemTapped');
    try {
      return super.onItemTapped(index);
    } finally {
      _$_HomeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
