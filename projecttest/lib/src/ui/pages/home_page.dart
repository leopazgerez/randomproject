import 'package:flutter/material.dart';
import 'package:projecttest/src/ui/page_components/card_component.dart';
import 'package:projecttest/src/ui/page_components/search_component.dart';
import 'package:projecttest/src/ui/page_components/second_card_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Component'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // CardComponent(
            //   image: 'https://i.pinimg.com/originals/7d/b3/53/7db3539960576e48ee49f7d1534a8d63.jpg',
            //   rating: 3.4,
            //   price: 89,
            //   title: 'Capuccino',
            //   subtitle: 'with Oat Milk',
            //   height: 300,
            // ),
            const SizedBox(height: 20,),
            // Expanded(
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 5,
            //       itemBuilder: (context, int item){return SecondCardComponent(image: 'https://i.pinimg.com/originals/7d/b3/53/7db3539960576e48ee49f7d1534a8d63.jpg',
            //     rating: 3.4,
            //     price: 89,
            //     title: 'Capuccino',
            //     subtitle: 'with Oat Milk',
            //     height: 400,
            //   );}),
            // ),
            // SecondCardComponent(image: 'https://i.pinimg.com/originals/7d/b3/53/7db3539960576e48ee49f7d1534a8d63.jpg',
            //     rating: 3.4,
            //     price: 89,
            //     title: 'Cappuccino',
            //     subtitle: 'with Oat Milk',
            //   aspectRatio: 5/6,
            //     height: 500,
            // )
            SearchComponent()
          ],
        ),
      ),
      bottomNavigationBar:  BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_sharp),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.heart_broken),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add_alert),label: ''),
      ],),
    );
  }
}
