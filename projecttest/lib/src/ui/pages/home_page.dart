import 'package:flutter/material.dart';
import 'package:projecttest/src/components/custom_card.dart';
import 'package:projecttest/src/components/custom_filter.dart';
import 'package:projecttest/src/models/breakfast_model.dart';
import 'package:projecttest/src/models/categorys_model.dart';
import 'package:projecttest/src/models/itembreakfast_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final searchControl = TextEditingController();
  late Categorys categorySelected;
  late BreakfastModel product1 = BreakfastModel(
      title: "Capuccino",
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "abab",
      rating: 4.5);
  late BreakfastModel product2 = BreakfastModel(
      title: "Cafe",
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "cdcd",
      rating: 4.5);
  late BreakfastModel product3 = BreakfastModel(
      title: "Te",
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "efef",
      rating: 4.5);
  late BreakfastModel product4 = BreakfastModel(
      title: "Capuccino",
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "hihi",
      rating: 4.5);
  late BreakfastModel product5 = BreakfastModel(
      title: "Te",
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "jkjk",
      rating: 4.5);
  late BreakfastModel product6 = BreakfastModel(
      title: "Cafe",
      photo: "https://www.clarin.com/img/2022/03/01/ceq4FUBv9_2000x1500__1.jpg",
      subtitle: "lmlm",
      rating: 4.5);
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
  late List<ItemBreakfastModel> itemsFilter = [];
  late List<ItemBreakfastModel> itemsSearch = [];
  Map<Categorys, bool> categoryMap = {
    Categorys.Cafe: true,
    Categorys.Capuccino: false,
    Categorys.Te: false
  };

  Categorys category() {
    return categoryMap.keys
        .firstWhere((element) => categoryMap[element] == true);
  }

  void filterBycategory() {
    itemsFilter = items
        .where((element) => element.product!.title == category().name)
        .toList();
  }

  void selectCategory(Categorys categorySelect) {
    setState(() {
      categoryMap.updateAll((key, value) => false);
      categoryMap.update(categorySelect, (value) => true);
      filterBycategory();
    });
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

  // void filterFinal() {
  //   setState(() {
  //     filterByCategory();
  //     if (searchControl.text.isNotEmpty) {
  //       filterSearch();
  //     }
  //   });
  // }

  @override
  void initState() {
    filterBycategory();

    searchControl.addListener(filterSearch);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Filter(searchControl, categoryMap, selectCategory),
          listScroll(),
        ]),
      ),
    );
  }

  Widget listScroll() {
    return SizedBox(
        height: 300,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  width: 20,
                ),
            itemCount: searchControl.text.isNotEmpty
                ? itemsSearch.length
                : itemsFilter.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomCard(searchControl.text.isNotEmpty
                  ? itemsSearch[index]
                  : itemsFilter[index]);
            }));
  }
}
