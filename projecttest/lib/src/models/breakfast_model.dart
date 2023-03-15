class BreakfastModel {
  String title;
  String photo;
  String description;
  String? features;
  String subtitle;
  String? ingredient;
  double rating;

  BreakfastModel(
      {required this.title,
      required this.description,
      required this.photo,
      required this.subtitle,
      this.features,
      this.ingredient,
      required this.rating});
}
