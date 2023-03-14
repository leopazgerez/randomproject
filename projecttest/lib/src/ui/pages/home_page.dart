import 'package:flutter/material.dart';
import 'package:projecttest/src/ui/components/filter_categories_component.dart';
import 'package:projecttest/src/ui/components/searcher_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [
    "Cappuccino",
    "Expresso",
    "Latte",
    "Flat white",
    "Instant",
    "Americano",
    "Mocha",
    "Irish",
    "Macchiato",
    "Ristretto",
    "Doppio",
  ];

  List<String> categories2 = [
    "Cappuccino",
    "Expresso",
  ];

  int categorySelected = 0;

  onSelected(index) {
    setState(() {
      categorySelected = index;
    });
    filterCards();
  }

  List<String> cards = [
    "Cappuccino",
    "Cappuccino primero",
    "Cappuccino segundo",
    "Cappuccino tercero",
    "Cappuccino cuarto",
    "Expresso",
    "Expresso 2",
    "Expresso 3",
    "Latte",
    "Flat white",
    "Instant",
    "Americano",
    "Mocha",
    "Irish",
    "Macchiato",
    "Ristretto",
    "Doppio",
  ];

  late List<String> currentCards = [];

  @override
  void initState() {
    onSelected(categorySelected);
    super.initState();
  }

  String searcherText = "";

  onChanged(String text) {
    setState(() {
      searcherText = text;
    });
    filterCards();
  }

  filterCards() {
    setState(() {
      //Category
      currentCards = cards
          .where((card) => card
              .toLowerCase()
              .contains(categories[categorySelected].toLowerCase()))
          .toList();
      //Search
      currentCards = currentCards
          .where(
              (card) => card.toLowerCase().contains(searcherText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0c1015),
        appBar: AppBar(
          title: const Center(child: Text("Coffee App")),
          backgroundColor: const Color(0xff0c1015),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SearcherComponent(
                  onChanged: onChanged,
                ),
              ),
              FilterCategoriesComponent(
                onSelected: onSelected,
                categories: categories,
              ),
              GridCards(
                cards: currentCards,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridCards extends StatelessWidget {
  final List<String>? cards;
  const GridCards({Key? key, this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      padding: const EdgeInsets.all(20),
      child: cards != null
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: cards!.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      )),
                  child: Text(
                    cards![index],
                    textAlign: TextAlign.center,
                  ),
                );
              },
            )
          : const Center(child: Text("Sin tarjetas")),
    );
  }
}
