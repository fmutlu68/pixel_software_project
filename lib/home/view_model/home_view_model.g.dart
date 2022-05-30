// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$selectedChoiceAtom =
      Atom(name: '_HomeViewModelBase.selectedChoice', context: context);

  @override
  int get selectedChoice {
    _$selectedChoiceAtom.reportRead();
    return super.selectedChoice;
  }

  @override
  set selectedChoice(int value) {
    _$selectedChoiceAtom.reportWrite(value, super.selectedChoice, () {
      super.selectedChoice = value;
    });
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void changeChoice(int newChoice) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeChoice');
    try {
      return super.changeChoice(newChoice);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedChoice: ${selectedChoice}
    ''';
  }
}
