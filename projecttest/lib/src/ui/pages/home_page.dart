import 'package:flutter/material.dart';
import 'package:projecttest/src/ui/components/filter_categories_component.dart';
import 'package:projecttest/src/ui/components/grid_cards.dart';
import 'package:projecttest/src/ui/components/searcher_component.dart';
import 'package:projecttest/src/ui/page_components/card_component.dart';
import 'package:projecttest/src/ui/page_components/search_component.dart';

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

  int categorySelected = 0;

  onSelected(index) {
    setState(() {
      categorySelected = index;
    });
    filterCards();
  }

  List<String> cards = [
    //aquí estaría la lista de cardComponent
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

  List<String> currentCards = [];

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

  bool cardsTest = true;

  changeCards() {
    setState(() {
      cardsTest = !cardsTest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0c1015),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffd27841),
          onPressed: changeCards,
          child: const Icon(
            Icons.cable_rounded,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: const Center(child: Text("Coffee App")),
          backgroundColor: const Color(0xff0c1015),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
              cardsTest
                  ? GridCards(
                      cards: currentCards,
                    )
                  : CardComponent(
                      image:
                          'https://i.pinimg.com/originals/7d/b3/53/7db3539960576e48ee49f7d1534a8d63.jpg',
                      rating: 3.4,
                      price: 89,
                      title: 'Capuccino',
                      subtitle: 'with Oat Milk',
                    ),
              // const Placeholder(
              //   child: SizedBox(
              //     height: 200,
              //   ),
              // )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_sharp), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.heart_broken), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.add_alert), label: ''),
          ],
        ),
      ),
    );
  }
}
