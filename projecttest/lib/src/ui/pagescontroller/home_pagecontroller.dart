import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:projecttest/src/models/breakfast_model.dart';

import '../../enums/category_enum.dart';

class HomePageController extends ControllerMVC {
  HomePageController._();
  static HomePageController _this = HomePageController._();
  static HomePageController get con => _this;
  factory HomePageController() {
    if (_this == null) _this = HomePageController();
    return _this;
  }
  TextEditingController controller = TextEditingController();
  final Map<CategoryEnum, bool> categories = {
    CategoryEnum.capuccino: true,
    CategoryEnum.chocolate: false,
    CategoryEnum.gorriadas: false,
    CategoryEnum.jugo: false,
    CategoryEnum.mate: false,
    CategoryEnum.sopa: false,
  };
  final List<BreakfastModel> searchResult = [];
  final List<BreakfastModel> itemToSearch = [
    BreakfastModel(
      title: 'Capuccino',
      category: CategoryEnum.capuccino,
      subtitle: 'Hola',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Chocolate',
      category: CategoryEnum.chocolate,
      subtitle: 'como',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Gorriadas',
      category: CategoryEnum.gorriadas,
      subtitle: 'te sientes',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Jugo',
      category: CategoryEnum.jugo,
      subtitle: 'hoy',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'submarino',
      category: CategoryEnum.chocolate,
      subtitle: 'espero',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'cortado',
      category: CategoryEnum.sopa,
      subtitle: 'que muy',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Mate',
      category: CategoryEnum.sopa,
      subtitle: 'bien porque yo',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Sopa',
      category: CategoryEnum.sopa,
      subtitle: 'estoy sacando',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Capuccino9',
      category: CategoryEnum.capuccino,
      subtitle: 'clavos',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Capuccino',
      category: CategoryEnum.capuccino,
      subtitle: 'de tanto',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Capuccino',
      category: CategoryEnum.capuccino,
      subtitle: 'errarle',
      description: 'sdfsdf',
    ),
  ];

  void selectCategory(CategoryEnum category) {
    categories.updateAll((key, value) => false);
    categories.update(category, (value) => true);
    filter();
  }

  void filter() {
    List<BreakfastModel> aux = [];
    for (var element in itemToSearch) {
      if ((element.subtitle!.contains(controller.text) ||
              controller.text.isEmpty) &&
          categories[element.category] != null &&
          categories[element.category]!) {
        aux.add(element);
      }
    }
    searchResult.clear();
    setState(() {
      searchResult.addAll(aux);
    });
  }
}
