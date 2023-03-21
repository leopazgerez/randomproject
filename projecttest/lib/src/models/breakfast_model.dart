import 'package:projecttest/src/models/categorys_model.dart';

class BreakfastModel {
  Categorys title;
  String photo;
  String? description;
  String? features;
  String subtitle;
  String? ingredient;
  double rating;

  BreakfastModel(
      {required this.title,
      this.description,
      required this.photo,
      required this.subtitle,
      this.features,
      this.ingredient,
      required this.rating});
}
