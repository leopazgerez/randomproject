import 'package:projecttest/src/enums/categorys_enum.dart';
import 'package:projecttest/src/enums/ingredient_enum.dart';

class BreakfastModel {
  Categorys title;
  String photo;
  String description;
  String features;
  String subtitle;
  Ingredients ingredient1;
  Ingredients ingredient2;
  double rating;
  int likes;

  BreakfastModel(
      {required this.title,
      required this.description,
      required this.photo,
      required this.subtitle,
      required this.features,
      required this.ingredient1,
      required this.ingredient2,
      required this.rating,
      required this.likes});
}
