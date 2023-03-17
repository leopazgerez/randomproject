import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projecttest/src/components/custom_filteraAndList.dart';
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
  late BreakfastModel product;
  late ItemBreakfastModel example;
  late List<ItemBreakfastModel> items;

  Map<Categorys, bool> category = {
    Categorys.Cafe: false,
    Categorys.Capuccino: false,
    Categorys.Te: true
  };

  Categorys categoryFilter() {
    return category.keys.firstWhere((element) => category[element] == true);
  }

  // List<ItemBreakfastModel> searchFilter() {
  //   late List<ItemBreakfastModel> resultSearch;

  //   return resultSearch;
  // }

  @override
  void initState() {
    product = BreakfastModel(
        title: "Capuccino",
        subtitle: "With oat milk",
        photo:
            "hhttps://e7r2euwepto.exactdn.com/wp-content/uploads/capuccino.jpg?strip=all&lossy=1&ssl=1g",
        rating: 4.5);
    example = ItemBreakfastModel(product: product, price: 4.20);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          FilterAndList(searchControl),
        ]),
      ),
    );
  }
}
