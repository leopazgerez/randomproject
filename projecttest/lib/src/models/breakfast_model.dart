import 'package:projecttest/src/enums/category_enum.dart';

class BreakfastModel {
  String? title;
  String? image;
  String? description;
  String? features;
  String? subtitle;
  String? ingredient;
  double? price;
  double? rating;
  CategoryEnum? category;

  BreakfastModel(
      {this.title,
      this.category,
      this.description,
      this.image,
      this.subtitle,
      this.features,
      this.ingredient,
      this.price,
      this.rating});
}
