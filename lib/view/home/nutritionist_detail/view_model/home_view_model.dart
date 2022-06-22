import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_pixel_project/view/home/nutritionist_detail/model/home_model.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late List<HomeModel> models;

  @observable
  int selectedChoice = 0;

  @override
  void setContext(BuildContext ctx) => pageContext = ctx;
  @override
  void init() {
    models = [
      HomeModel(0, "Hakkımda"),
      HomeModel(1, "Hizmetler"),
      HomeModel(2, "Randevu Al"),
      HomeModel(3, "Blog"),
    ];
  }

  @override
  void onDispose() {}

  @action
  void changeChoice(int newChoice) => selectedChoice = newChoice;
}
