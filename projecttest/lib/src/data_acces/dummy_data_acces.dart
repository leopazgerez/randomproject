import 'package:projecttest/src/enums/categorys_enum.dart';
import 'package:projecttest/src/enums/ingredient_enum.dart';
import 'package:projecttest/src/interfaces/i_data_acces.dart';
import 'package:projecttest/src/models/breakfast_model.dart';
import 'package:projecttest/src/models/itembreakfast_model.dart';

class DummyData implements IDataAcces {
  late BreakfastModel product1 = BreakfastModel(
      title: Categorys.Capuccino,
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "abab",
      description:
          "El capuchino​ es una bebida nacida en Italia, preparada con café expreso y leche montada con vapor para darle cremosidad. Un capuchino se compone de 125 ml de leche y 25 ml de café expreso, en ocasiones se agrega cacao en polvo o canela según el gusto del consumidor.",
      rating: 4.5,
      likes: 12043,
      ingredient1: Ingredients.Agua,
      ingredient2: Ingredients.Cafe,
      features: "nose nose");
  late BreakfastModel product2 = BreakfastModel(
      title: Categorys.Cafe,
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "cdcd",
      description:
          "El capuchino​ es una bebida nacida en Italia, preparada con café expreso y leche montada con vapor para darle cremosidad. Un capuchino se compone de 125 ml de leche y 25 ml de café expreso, en ocasiones se agrega cacao en polvo o canela según el gusto del consumidor.",
      rating: 4.5,
      likes: 12043,
      ingredient1: Ingredients.Agua,
      ingredient2: Ingredients.Cafe,
      features: "nose nose");
  late BreakfastModel product3 = BreakfastModel(
      title: Categorys.Te,
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "efef",
      description:
          "El capuchino​ es una bebida nacida en Italia, preparada con café expreso y leche montada con vapor para darle cremosidad. Un capuchino se compone de 125 ml de leche y 25 ml de café expreso, en ocasiones se agrega cacao en polvo o canela según el gusto del consumidor.",
      rating: 4.5,
      likes: 12043,
      ingredient1: Ingredients.Agua,
      ingredient2: Ingredients.Cafe,
      features: "nose nose");
  late BreakfastModel product4 = BreakfastModel(
      title: Categorys.Capuccino,
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "hihi",
      description:
          "El capuchino​ es una bebida nacida en Italia, preparada con café expreso y leche montada con vapor para darle cremosidad. Un capuchino se compone de 125 ml de leche y 25 ml de café expreso, en ocasiones se agrega cacao en polvo o canela según el gusto del consumidor.",
      rating: 4.5,
      likes: 12043,
      ingredient1: Ingredients.Agua,
      ingredient2: Ingredients.Cafe,
      features: "nose nose");
  late BreakfastModel product5 = BreakfastModel(
      title: Categorys.Cafe,
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "jkjk",
      description:
          "El capuchino​ es una bebida nacida en Italia, preparada con café expreso y leche montada con vapor para darle cremosidad. Un capuchino se compone de 125 ml de leche y 25 ml de café expreso, en ocasiones se agrega cacao en polvo o canela según el gusto del consumidor.",
      rating: 4.5,
      likes: 12043,
      ingredient1: Ingredients.Agua,
      ingredient2: Ingredients.Cafe,
      features: "nose nose");
  late BreakfastModel product6 = BreakfastModel(
      title: Categorys.Te,
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "lmlm",
      description:
          " Un capuchino se compone de 125 ml de leche y 25 ml de café expreso.",
      rating: 4.5,
      likes: 12043,
      ingredient1: Ingredients.Agua,
      ingredient2: Ingredients.Cafe,
      features: "nose nose");
  late ItemBreakfastModel item1 =
      ItemBreakfastModel(product: product1, price: 30.0);
  late ItemBreakfastModel item2 =
      ItemBreakfastModel(product: product2, price: 30.0);
  late ItemBreakfastModel item3 =
      ItemBreakfastModel(product: product3, price: 30.0);
  late ItemBreakfastModel item4 =
      ItemBreakfastModel(product: product4, price: 30.0);
  late ItemBreakfastModel item5 =
      ItemBreakfastModel(product: product5, price: 30.0);
  late ItemBreakfastModel item6 =
      ItemBreakfastModel(product: product6, price: 30.0);
  late List<ItemBreakfastModel> items = [
    item1,
    item2,
    item3,
    item4,
    item5,
    item6
  ];
  Map<Categorys, bool> categoryMap = {
    Categorys.Cafe: true,
    Categorys.Capuccino: false,
    Categorys.Te: false
  };

  @override
  Map<Categorys, bool> getCategorys() {
    return categoryMap;
  }

  @override
  List<ItemBreakfastModel> getListItems() {
    return items;
  }
}
