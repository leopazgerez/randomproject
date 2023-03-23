import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:projecttest/src/managers/datamanager.dart';
import 'package:projecttest/src/models/breakfast_model.dart';
import '../../enums/category_enum.dart';

class HomePageController extends ControllerMVC {
  DataManager dataManager;

  HomePageController._(this.dataManager);
  static final HomePageController _this = HomePageController._(DataManager());
  static HomePageController get con => _this;
  factory HomePageController() {
    return _this;
  }

  late TextEditingController filterController;
  Map<CategoryEnum, bool> categories = {};
  List<BreakfastModel> productList = [];
  List<BreakfastModel> searchResult = [];

  CategoryEnum selectedCategory = CategoryEnum.capuccino;

  void initPage() {
    filterController = TextEditingController();
    categories = dataManager.getCategory();
    productList = dataManager.getProductList();
    filterResult;
  }

  selectCategory(CategoryEnum category) {
    selectedCategory = category;
    categories.updateAll((key, value) => false);
    categories.update(category, (value) => true);
    filterResult();
      // setState
      // searchResult = productList
      //     .where((element) => element.category == selectedCategory)
      //     .toList();
  }

  filterResult() {
    List<BreakfastModel> aux = [];
    for (var element in productList) {
      if ((element.subtitle!.toLowerCase().contains(filterController.text) ||
              filterController.text.isEmpty) &&
          categories[element.category] != null &&
          categories[element.category]!) {
        aux.add(element);
      }
      searchResult.clear();
      setState(() {
        searchResult.addAll(aux);
      });
    }

    // LINQ

    // searchResult = productList
    //     .where((element) => element.category == selectedCategory)
    //     .toList();

    // });
  }
}
