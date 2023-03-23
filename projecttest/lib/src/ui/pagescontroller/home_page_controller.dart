import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:projecttest/src/enums/categorys_enum.dart';
import 'package:projecttest/src/managers/data_manager.dart';
import 'package:projecttest/src/models/breakfast_model.dart';
import 'package:projecttest/src/enums/ingredient_enum.dart';
import 'package:projecttest/src/models/itembreakfast_model.dart';

class HomePageController extends ControllerMVC {
  final DataManager dataManager;

  HomePageController._(this.dataManager);
  static late HomePageController _this;

  factory HomePageController() {
    _this = HomePageController._(DataManager());
    return _this;
  }

  static HomePageController get con => _this;

  final searchControl = TextEditingController();
  late List<ItemBreakfastModel> itemsFilter = [];
  late List<ItemBreakfastModel> itemsSearch = [];

  void initPage() {
    filterByCategory();
    searchControl.addListener(filterSearch);
  }

  Categorys category() {
    return dataManager.dataAcces.getCategorys().keys.firstWhere(
        (element) => dataManager.dataAcces.getCategorys()[element] == true);
  }

  void onItem() {
    setState(() {
      searchControl.clear();
      filterByCategory();
    });
  }

  filterByCategory() {
    itemsFilter = dataManager.dataAcces
        .getListItems()
        .where((element) => element.product!.title == category())
        .toList();
  }

  void filterSearch() {
    setState(() {
      itemsSearch = itemsFilter
          .where((element) => element.product!.subtitle
              .toLowerCase()
              .contains(searchControl.text.toLowerCase()))
          .toList();
    });
  }
}
