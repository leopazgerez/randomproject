import 'package:flutter/material.dart';
import 'package:projecttest/src/ui/page_components/card_component.dart';

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
      body: Column(
        children: [
          CardComponent(
            image: 'https://i.pinimg.com/originals/7d/b3/53/7db3539960576e48ee49f7d1534a8d63.jpg',
            rating: 3.4,
            price: 89,
            title: 'Capuccino',
            subtitle: 'with Oat Milk',
          ),
          Placeholder(child: SizedBox(height: 200,),)
        ],
      ),
    );
  }
}
// 'https://i.pinimg.com/originals/7d/b3/53/7db3539960576e48ee49f7d1534a8d63.jpg'