import 'package:flutter/material.dart';
import 'package:projecttest/src/components/custom_button.dart';
import 'package:projecttest/src/components/custom_card.dart';
import 'package:projecttest/src/components/custom_filteraAndList.dart';
import 'package:projecttest/src/models/breakfast_model.dart';
import 'package:projecttest/src/models/categorys_model.dart';
import 'package:projecttest/src/models/itembreakfast_model.dart';

class MyHomePage extends StatefulWidget {
  final BreakfastModel product;
  final ItemBreakfastModel example;
  final List<ItemBreakfastModel> items;
  final Category category1;
  final Category category2;
  final Category category3;
  final List<Category> categorys;

  MyHomePage({
    this.product = BreakfastModel(
        title: "Capuccino",
        subtitle: "With oat milk",
        photo:
            "hhttps://e7r2euwepto.exactdn.com/wp-content/uploads/capuccino.jpg?strip=all&lossy=1&ssl=1g",
        rating: 4.5),
    this.example =
        ItemBreakfastModel(product: product, price: 4.20);

    this.items = [
      example,
      example,
      example,
      example,
    ];
    super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [FilterAndList(searchController)]),
      ),
    );
  }
}
