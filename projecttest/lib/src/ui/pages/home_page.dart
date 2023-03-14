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
          CardComponent(),
          Placeholder(child: SizedBox(height: 200,),)
        ],
      ),
    );
  }
}
